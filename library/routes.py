from flask import Flask, render_template, request, flash, redirect, url_for, abort
from flask_mysqldb import MySQL
from library import app, db ## initially created by __init__.py, need to be used here
import subprocess, os
@app.route("/")
def index():
    try:
        ## create connection to database
        cur = db.connection.cursor()
        ## execute query
        cur.execute("SELECT g.grade, s.first_name, s.last_name FROM students s INNER JOIN grades g ON g.student_id = s.id WHERE g.course_name = 'DRI' ORDER BY g.grade DESC LIMIT 1")
        ## cursor.fetchone() does not return the column names, only the row values
        ## thus we manually create a mapping between the two, the dictionary res
        column_names = [i[0] for i in cur.description]
        res = dict(zip(column_names, cur.fetchone()))
        best_dribbling_grade = res.get("grade")
        best_dribbler = res.get("first_name") + " " + res.get("last_name")

        cur.execute("SELECT g.grade, s.first_name, s.last_name FROM students s INNER JOIN grades g ON g.student_id = s.id WHERE g.course_name = 'SHO' ORDER BY g.grade DESC LIMIT 1")
        res = dict(zip(column_names, cur.fetchone()))
        cur.close()
        best_shooting_grade = res.get("grade")
        best_shooter = res.get("first_name") + " " + res.get("last_name")

        return render_template("landing.html",
                               pageTitle = "Main Page")
    except Exception as e:
        print(e)
        return render_template("landing.html", pageTitle = "Main Page")

@app.errorhandler(404)
def page_not_found(e):
    # note that we set the 404 status explicitly
    return render_template("errors/404.html", pageTitle = "Not Found"), 404

@app.errorhandler(500)
def page_not_found(e):
    return render_template("errors/500.html", pageTitle = "Internal Server Error"), 500


@app.route("/backup", methods=['GET'])
def backup():
    try:
        # Retrieve the path of the current working directory
        current_path = os.getcwd()

        # Set the backup file path based on the current working directory
        backup_path = os.path.join(current_path, 'backup_file.sql')
        # Run backup command using mysqldump
        # Replace [username], [password], [database_name], and [backup_file.sql] with appropriate values
        backup_command = f"mysqldump -u {app.config['MYSQL_USER']} -p{app.config['MYSQL_PASSWORD']} " \
                         f"{app.config['MYSQL_DB']} > {backup_path}"
        subprocess.call(backup_command, shell=True)
        flash("Backup successful!", "success")
        return redirect("/")
    except Exception as e:
        flash(str(e), "danger")
        return redirect("/")


@app.route("/restore", methods=['POST'])
def restore():
    try:
        # Check if the backup file is included in the request
        if 'backup_file' not in request.files:
            flash("No file selected.", "danger")
            return redirect("/")

        # Get the backup file from the request
        backup_file = request.files['backup_file']

        # Retrieve the path of the current working directory
        current_path = os.getcwd()

        # Set the restore file path based on the current working directory
        restore_path = os.path.join(current_path, 'backup_file.sql')

        # Save the backup file to the restore path
        backup_file.save(restore_path)

        # Run restore command using mysql
        restore_command = f"mysql -u {app.config['MYSQL_USER']} -p{app.config['MYSQL_PASSWORD']} " \
                          f"{app.config['MYSQL_DB']} < {restore_path}"
        subprocess.call(restore_command, shell=True)

        flash("Restored!", "success")
        return redirect("/")
    except Exception as e:
        flash(str(e), "danger")
        return redirect("/")