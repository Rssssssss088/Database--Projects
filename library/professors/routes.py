from flask import Flask, render_template, request, flash, redirect, url_for, abort
from flask_mysqldb import MySQL
from library import db ## initially created by __init__.py, need to be used here
from library.professors.forms import ProfessorCreate
from library.professors import professors
from library.user.forms import UserCreate


@professors.route("/professor/create", methods = ["GET", "POST"]) ## "GET" by default
def createProfessor():

    """
    Create new user in the database
    """

    form1 = UserCreate()
    form2 = ProfessorCreate()

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

    form1 = UserCreate()
    form2 = ProfessorCreate()
    cur = db.connection.cursor()
    cur.execute('SELECT school_id, school_name FROM school_units;')
    form1.school_name.choices = list(cur.fetchall())
    print(form1.school_name.choices )
    ## each tuple in the above list is in the format (id, full name),
    ## and will be rendered in html as an <option> of the <select>
    ## element, with value = id and content = full_name
    cur.close()

    ## when the form is submitted
    if (request.method == "POST" and form1.validate_on_submit()):
        form1 = UserCreate()
        form2 = ProfessorCreate()
        newUser = form1.__dict__
        newProfessor = form2.__dict__
        query1 = "INSERT INTO user(username, password, school_id, first_name, last_name, email, phone, street_name, street_num, birthdate) VALUES ('{}','{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}');".format(
            newUser['username'].data, newUser['password'].data, newUser['school_name'].data, newUser['first_name'].data,
            newUser['last_name'].data, newUser['email'].data, newUser['phone'].data, newUser['street_name'].data,
            newUser['street_num'].data, newUser['birthdate'].data)
        query2 = "insert into professors (username, specialty) values ('{}','{}');".format(
            newUser['username'].data, newProfessor['specialty'].data)
        query3 = "insert into lib_ops(username) values ('{}');".format(newUser['username'].data)

        try:
            cur = db.connection.cursor()
            cur.execute(query1)
            cur.execute(query2)
            if (newProfessor['lib_op'].data == True):
                cur.execute(query3)
                flash("Applied for library operator", "success")
            db.connection.commit()
            cur.close()
            flash("Professor inserted successfully", "success")
            return render_template("waiting_for_approval.html", pageTitle="Waiting Approval")
        except Exception as e:  ## OperationalError
            flash(str(e), "danger")
    else:
        try:

            return render_template("signup_professor.html", pageTitle="Professor SignUp", form=form1, form_p=form2)
        except Exception as e:  ## OperationalError
            flash(str(e), "danger")
    return render_template("signup_professor.html", pageTitle="Professor SignUp", form=form1, form_p=form2)

@professors.route("/professor/update/<username>", methods = ["GET", "POST"]) ## "GET" by default
def updateProfessor(username):

    """
    Create new user in the database
    """

    form1 = UserCreate()
    form2 = ProfessorCreate()

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

    form1 = UserCreate()
    form2 = ProfessorCreate()
    cur = db.connection.cursor()
    cur.execute("select * from user where username='{}';".format(username))
    user_data = cur.fetchone()
    form1.username.data = user_data[0]
    form1.password.data = user_data[2]
    form1.first_name.data = user_data[3]
    form1.last_name.data = user_data[4]
    form1.email.data = user_data[5]
    form1.phone.data = user_data[6]
    form1.street_name.data = user_data[7]
    form1.street_num.data = user_data[8]
    form1.birthdate.data = user_data[9]
    cur.execute('SELECT school_id, school_name FROM school_units;')
    form1.school_name.choices = list(cur.fetchall())
    cur.execute("select * from professors where username='{}';".format(username))
    professor_data=cur.fetchone()
    form2.specialty.data=professor_data[1]

    ## each tuple in the above list is in the format (id, full name),
    ## and will be rendered in html as an <option> of the <select>
    ## element, with value = id and content = full_name
    cur.close()

    ## when the form is submitted
    if (request.method == "POST" and form1.validate_on_submit()):
        form1 = UserCreate()
        form2 = ProfessorCreate()
        newUser = form1.__dict__
        newProfessor = form2.__dict__
        query1 = "update user set password='{}', school_id='{}', first_name='{}', last_name='{}', email='{}', phone='{}', street_name='{}', street_num='{}', birthdate='{}' where username='{}';".format(
             newUser['password'].data, newUser['school_name'].data, newUser['first_name'].data,
            newUser['last_name'].data, newUser['email'].data, newUser['phone'].data, newUser['street_name'].data,
            newUser['street_num'].data, newUser['birthdate'].data, newUser['username'].data)
        query2 = "update professors set specialty='{}' where username='{}';".format(
             newProfessor['specialty'].data, newUser['username'].data)
        query3 = "update lib_ops set username='{}';".format(newUser['username'].data)

        try:
            cur = db.connection.cursor()
            cur.execute(query1)
            cur.execute(query2)
            if (newProfessor['lib_op'].data == True):
                cur.execute(query3)
                flash("Applied for library operator", "success")
            db.connection.commit()
            cur.close()
            flash("Professor updated successfully", "success")
            return redirect(url_for("user.PresentUser", pageTitle="Waiting Approval", username=username))
        except Exception as e:  ## OperationalError
            flash(str(e), "danger")
    else:
        try:

            return render_template("signup_professor.html", pageTitle="Professor Edit", form=form1, form_p=form2)
        except Exception as e:  ## OperationalError
            flash(str(e), "danger")
    return render_template("signup_professor.html", pageTitle="Professor Edit", form=form1, form_p=form2)



