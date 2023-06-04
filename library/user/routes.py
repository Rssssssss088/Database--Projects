from flask import Flask, render_template, request, flash, redirect, url_for, abort
from flask_mysqldb import MySQL
from library import db  # initially created by __init__.py, need to be used here
from library.user.forms import UserCreate, UserLogin, Password
from library.user import user
from library.professors.forms import ProfessorCreate

from traceback import print_exc


@user.route('/user/update/password/<username>', methods=['GET', 'POST'])
def PasswordChange(username):

    form_pass=Password();

    ## when the form is submitted
    if(request.method == "POST" and form_pass.validate_on_submit()):
        form_pass= Password()
        newPassword = form_pass.__dict__
        query = "update user set password='{}' where username='{}';"\
            .format(
            newPassword['password'].data,
            username
        )
        try:
            cur = db.connection.cursor()
            cur.execute(query)
            db.connection.commit()
            cur.close()
            flash("Password changed successfully", "success")
            return redirect(url_for("user.PresentUser", username=username))
        except Exception as e: ## OperationalError
            flash(str(e), "danger")
    else:
        try:
            return render_template("change_password.html", pageTitle="Change Password", form=form_pass)
        except Exception as e:  ## OperationalError
            flash(str(e), "danger")


@user.route('/user/<credentials>')
def UserMain(credentials):
    cred=eval(credentials)
    return render_template('user_main.html', credentials=cred)


@user.route('/lib_op/<credentials>')
def LibOpMain(credentials):
    cred=eval(credentials)
    return render_template('lib_op_main.html', credentials=cred)


@user.route('/admin/<admin>')
def AdminMain(admin):
    cred=eval(admin)
    return render_template('admin_main.html', credentials=cred)


@user.route('/user/data/<username>', methods=['GET'])
def PresentUser(username):
    try:
        form=UserCreate()
        form_p=ProfessorCreate()
        # Establish a connection to the database
        connection = db.connection
        cur = connection.cursor()
        # Execute a sample query
        cur.execute("SELECT u.username, u.password, su.school_name, u.first_name, u.last_name, u.email, u.phone, u.street_name, u.street_num, u.birthdate, u.age, u.can_rent, u.can_reserve, u.penalty, u.approved_by_op, p.specialty, s.class_num, s.class_grade, s.class_tier from user u left join professors p on u.username=p.username left join students s on s.username=u.username join school_units su on u.school_id=su.school_id where u.username='{}';"
                    .format(username))

        # Fetch all the query results
        column_names = [i[0] for i in cur.description]
        results_data = cur.fetchone()
        results = dict(zip(column_names, results_data))
        cur = db.connection.cursor()
        cur.close()
        connection = db.connection
        cur = connection.cursor()
        cur.execute("SELECT school_id, school_name FROM school_units;")
        form.school_name.choices = list(cur.fetchall())
        ## each tuple in the above list is in the format (id, full name),
        ## and will be rendered in html as an <option> of the <select>
        ## element, with value = id and content = full_name
        cur.close()

        # Close the cursor and connection
        return render_template("user.html", user=results, form=form, form_p=form_p)


    except Exception as e:
        return 'Failed to connect to the database: {}'.format(str(e))

    return 'Failed to connect to the database.'


@user.route("/user/login", methods = ["GET", "POST"]) ## "GET" by default
def LoginUser():

    """
    Create new user in the database
    """
    form = UserLogin()
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
    if request.method == "POST" and form.validate_on_submit():
        newUser = form.__dict__
        query = "SELECT username, first_name, last_name, school_id, can_rent, can_reserve, penalty, approved_by_op FROM user WHERE username='{}' AND password='{}';".format(
            newUser['username'].data, newUser['password'].data)

        try:
            credentials = None
            admin = None
            lib_op = None

            cur = db.connection.cursor()
            cur.execute(query)
            column_names = [i[0] for i in cur.description]
            credentials_data = cur.fetchone()  # Fetch the result once
            if credentials_data:
                credentials = dict(zip(column_names, credentials_data))
            cur.close()

            cur = db.connection.cursor()
            cur.execute("SELECT username, first_name, last_name FROM admins WHERE username='{}' and password='{}';".format(newUser['username'].data, newUser['password'].data))
            column_names = [i[0] for i in cur.description]
            admin_data = cur.fetchone()  # Fetch the result once
            if admin_data:
                admin = dict(zip(column_names, admin_data))
            cur.close()

            cur = db.connection.cursor()
            cur.execute("SELECT username, approved_by_admin from lib_ops where username='{}';".format(newUser['username'].data))
            lib_op_data = cur.fetchone()  # Fetch the result once
            if lib_op_data:
                lib_op = dict(zip(column_names, lib_op_data))
            cur.close()

            if admin:
                flash("Logged In", "success")
                return redirect(url_for('user.AdminMain', admin=admin))
            elif not credentials:
                flash("Couldn't find user. Please make sure that your password and username are correct", "danger")
            elif lib_op and lib_op.get("first_name") is not None:
                flash("Logged In", "success")
                return redirect(url_for('user.LibOpMain', credentials=credentials))
            elif credentials.get("approved_by_op") is not None:
                flash("Logged In", "success")
                return redirect(url_for('user.UserMain', credentials=credentials))
            else:
                flash("Oops... Seems like you haven't been accepted yet. Please try again later!", "danger")
        except Exception as e:
            flash(str(e), "danger")

    ## The rest of the code remains the same

    ## else, response for GET request
    return render_template("login.html", pageTitle = "Login", form = form)

@user.route("/user/data/update/<username>", methods = ["POST"])
def updateUser(username):
    """
    Update a user in the database, by username
    """
    form = UserCreate() ## see createUser for explanation
    form_p = ProfessorCreate()
    updateData = form.__dict__
    updateProf=form_p.__dict__
    if(form.validate_on_submit()):
        query1 = "UPDATE user SET first_name = '{}', last_name = '{}', email = '{}', street_name='{}', street_num = '{}', phone = '{}', birthdate = '{}',  WHERE username = {};"\
            .format(
            updateData['first_name'].data,
            updateData['last_name'].data,
            updateData['email'].data,
            updateData['street_name'].data,
            updateData['street_num'].data,
            updateData['phone'].data,
            updateData['birthdate'].data,
            username
        )
        query2 = "UPDATE user SET specialty='{}' where username='{}';" \
                 .format(
            updateProf['specialty'].data,
            username
        )
        try:
            cur = db.connection.cursor()
            cur.execute(query1)
            cur.execute(query2)
            db.connection.commit()
            cur.close()
            flash("User updated successfully", "success")
        except Exception as e:
            flash(str(e), "danger")
    else:
        for category in form.errors.values():
            for error in category:
                flash(error, "danger")
                flash("Why the fuck", "danger")
    flash("Why", "danger")
    return redirect(url_for("user.LoginUser", username=username))

@user.route("/user/delete/<username>", methods = ["POST"])
def deleteUser(username):
    """
    Delete user by username from database
    """
    query = f"DELETE FROM user WHERE username = {username};"
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        flash("User deleted successfully", "primary")
    except Exception as e:
        flash(str(e), "danger")
    return redirect(url_for("user.getUser"))


@user.route("/lib_op/user/<school_id>/<lib_op>")
def OpUser(school_id, lib_op):
    """
    Retrieve students from database
    """

    try:
        cur = db.connection.cursor()
        cur.execute("SELECT u.username, u.password, su.school_name, u.first_name, u.last_name, u.email, u.phone, u.street_name, u.street_num, u.birthdate, u.age, u.can_rent, u.can_reserve, u.penalty, u.approved_by_op, p.specialty, s.class_num, s.class_grade, s.class_tier from user u left join professors p on u.username=p.username left join students s on s.username=u.username join school_units su on u.school_id=su.school_id where u.school_id='{}';"
                    .format(school_id))
        column_names = [i[0] for i in cur.description]
        users = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        return render_template("lib_op_user.html", users = users, pageTitle = "Users Page", school_id=school_id, lib_op=lib_op)
    except Exception as e:
        ## if the connection to the database fails, return HTTP response 500
        flash(str(e), "danger")
        abort(500)


@user.route("/lib_op/approve/user/<school_id>/<lib_op>/<username>", methods = ["POST"])
def ApproveOperator(school_id, lib_op, username):
    query = "UPDATE user SET approved_by_op = '{}' WHERE username='{}';".format(lib_op, username)
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        flash(f"User {username} approved successfully", "success")
        flash(f"{username}'s card printed automatically, succesfully", "success")
    except Exception as e:
        flash(str(e), "danger")
    return redirect(url_for("user.OpUser", lib_op=lib_op, school_id=school_id))


@user.route("/lib_op/disapprove/user/<school_id>/<lib_op>/<username>", methods=["POST"])
def DisapproveOperator(school_id, lib_op, username):
    query = "UPDATE user SET approved_by_op = NULL WHERE username='{}';".format(username)
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        flash(f"User {username} disapproved successfully", "success")
    except Exception as e:
        flash(str(e), "danger")
    return redirect(url_for("user.OpUser", lib_op=lib_op, school_id=school_id))


@user.route("/lib_op/delete/user/<school_id>/<lib_op>/<username>", methods = ["POST"])
def deleteOperator(school_id, lib_op, username):
    """
    Delete students by id from database
    """
    query = f"BEGIN; DELETE FROM reservations WHERE username = '{username}'; DELETE FROM rentals WHERE username = '{username}'; DELETE FROM reviews WHERE username = '{username}'; DELETE FROM professors WHERE username = '{username}'; DELETE FROM students WHERE username = '{username}'; COMMIT;"
    query2 = f"DELETE FROM user WHERE username = '{username}';"
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        cur.execute(query2)
        db.connection.commit()
        cur.close()
        flash(f"User {username} deleted successfully", "primary")
    except Exception as e:
        flash(str(e), "danger")
    return redirect(url_for("user.OpUser", lib_op=lib_op, school_id=school_id))

@user.route("/lib_op/print/user/<school_id>/<lib_op>/<username>", methods=["GET"])
def PrintUser(school_id, lib_op, username):
    flash(f"{username}'s card printed succesfully","success")
    return redirect(url_for("user.OpUser", lib_op=lib_op, school_id=school_id))
