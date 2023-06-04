from flask import Flask, render_template, request, flash, redirect, url_for, abort
from flask_mysqldb import MySQL
from library import db ## initially created by __init__.py, need to be used here
from library.school_units.forms import CreateSchool
from library.school_units import school_units


@school_units.route("/admin/schools/<username>", methods=["GET"])
def showSchools(username):
    query = "select * from lib_ops l join user u on  l.username=u.username right join school_units su on u.school_id=su.school_id ;"

    try:
        cur = db.connection.cursor()
        cur.execute(query)
        column_names = [i[0] for i in cur.description]
        schools = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        return render_template("admin_school.html", pageTitle="Schools", schools=schools)
    except Exception as e:  ## OperationalError
        flash(str(e), "danger")
        credentials={}
        credentials['username']=username
        flash(f"{{credentials.username}}")
        return redirect(url_for('user.AdminMain', credentials=credentials))


@school_units.route("/admin/school/create/<username>", methods = ["GET", "POST"]) ## "GET" by default
def createSchool(username):

    """
    Create new user in the database
    """

    form = CreateSchool()

    ## This is an object of a class that inherits FlaskForm
    ## which in turn inherits Form from wtforms
    ## https://flask-wtf.readthedocs.io/en/0.15.x/api/#flask_wtf.FlaskForm
    ## https://wtforms.readthedocs.io/en/2.3.x/forms/#wtforms.form.Form
    ## If no form data is specified via the formdata parameter of Form
    ## (it isn't here) it will implicitly use flask.request.form and flask.request.files.
    ## So when this method is called because of a GET request, the request
    ## object's form field will not contain user input, whereas if the HTTP
    ## request type is POST, it will implicitly retrieve the data.
    ## https://flask-wtf.readthedocs.io/en/0.15.x/form/
    ## Alternatively, in the case of a POST request, the data could have between
    ## retrieved directly from the request object: request.form.get("key name")

    ## when the form is submitted
    if (request.method == "POST" and form.validate_on_submit()):
        form = CreateSchool()
        newSchool = form.__dict__
        query = "INSERT INTO school_units(school_id, school_name, principal_mid_name, principal_first_name, principal_last_name, email, phone, street_name, street_num, city) VALUES ('{}','{}', '{}', '{}' ,'{}', '{}', '{}', '{}', '{}', '{}');".format(
            newSchool['school_id'].data, newSchool['school_name'].data, newSchool['principal_mid_name'].data, newSchool['principal_first_name'].data,
            newSchool['principal_last_name'].data, newSchool['email'].data, newSchool['phone'].data, newSchool['street_name'].data,
            newSchool['street_num'].data, newSchool['city'].data)

        try:
            cur = db.connection.cursor()
            cur.execute(query)
            db.connection.commit()
            cur.close()
            flash("School inserted successfully", "success")
            return redirect(url_for("school_units.showSchools", username=username))
        except Exception as e:  ## OperationalError
            flash(str(e), "danger")
    else:
        try:

            return render_template("admin_create_school.html", pageTitle="Create School", form=form)
        except Exception as e:  ## OperationalError
            flash(str(e), "danger")
    return render_template("admin_create_school.html", pageTitle="Create School", form=form)


@school_units.route('/admin/school/delete/<username>/<school_id>', methods=['POST'])
def deleteSchool(school_id, username):
    try:
        cur = db.connection.cursor()
        cur.execute("Delete from school_units where school_id='{}'").format(school_id)
        db.connection.commit()
        cur.close()
        flash("School deleted successfully", "success")
        return redirect(url_for("school_units.showSchools", username=username))
    except Exception as e:  ## OperationalError
        flash(str(e), "danger")
        return redirect(url_for("school_units.showSchools", username=username))


