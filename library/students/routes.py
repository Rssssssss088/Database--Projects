from flask import Flask, render_template, request, flash, redirect, url_for, abort
from flask_mysqldb import MySQL
from library import db ## initially created by __init__.py, need to be used here
from library.students.forms import StudentCreate
from library.user.forms import UserCreate
from library.students import students

@students.route("/students")
def getStudents():
    """
    Retrieve students from database
    """
    try:
        form = StudentForm()
        cur = db.connection.cursor()
        cur.execute("SELECT * FROM students")
        column_names = [i[0] for i in cur.description]
        students = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        return render_template("students.html", students = students, pageTitle = "Students Page", form = form)
    except Exception as e:
        ## if the connection to the database fails, return HTTP response 500
        flash(str(e), "danger")
        abort(500)

@students.route("/student/create", methods = ["GET", "POST"]) ## "GET" by default
def createStudent():

    """
    Create new user in the database
    """

    form1 = UserCreate()
    form2 = StudentCreate()

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
    form2 = StudentCreate()
    cur = db.connection.cursor()
    cur.execute('SELECT school_id, school_name FROM school_units;')
    form1.school_name.choices = list(cur.fetchall())
    ## each tuple in the above list is in the format (id, full name),
    ## and will be rendered in html as an <option> of the <select>
    ## element, with value = id and content = full_name
    cur.close()

    ## when the form is submitted
    if(request.method == "POST" and form1.validate_on_submit()):
        form1 = UserCreate()
        form2 = StudentCreate()
        newUser = form1.__dict__
        newStudent = form2.__dict__
        query1 = "INSERT INTO user(username, password, school_id, first_name, last_name, email, phone, street_name, street_num, birthdate) VALUES ('{}','{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}', '{}');".format(newUser['username'].data,newUser['password'].data,newUser['school_name'].data,newUser['first_name'].data,newUser['last_name'].data,newUser['email'].data,newUser['phone'].data,newUser['street_name'].data, newUser['street_num'].data, newUser['birthdate'].data)
        query2 = "insert into students(username, class_num, class_grade, class_tier) values ('{}','{}','{}','{}');".format(newUser['username'].data, newStudent['class_num'].data, newStudent['class_grade'].data, newStudent['class_tier'].data)
        try:
            cur = db.connection.cursor()
            cur.execute(query1)
            cur.execute(query2)
            db.connection.commit()
            cur.close()
            flash("Student inserted successfully", "success")
            return render_template("waiting_for_approval.html", pageTitle = "Waiting Approval")
        except Exception as e: ## OperationalError
            flash(str(e), "danger")
    else:
        try:

            return render_template("signup_student.html", pageTitle="Student SignUp", form=form1, form_s=form2)
        except Exception as e:  ## OperationalError
            flash(str(e), "danger")
    return render_template("signup_student.html", pageTitle="Student SignUp", form=form1, form_s=form2)


@students.route("/students/update/<int:studentID>", methods = ["POST"])
def updateStudent(studentID):
    """
    Update a students in the database, by id
    """
    form = StudentForm() ## see createStudent for explanation
    updateData = form.__dict__
    if(form.validate_on_submit()):
        query = "UPDATE students SET first_name = '{}', last_name = '{}', email = '{}' WHERE id = {};".format(updateData['first_name'].data, updateData['last_name'].data, updateData['email'].data, studentID)
        try:
            cur = db.connection.cursor()
            cur.execute(query)
            db.connection.commit()
            cur.close()
            flash("Student updated successfully", "success")
        except Exception as e:
            flash(str(e), "danger")
    else:
        for category in form.errors.values():
            for error in category:
                flash(error, "danger")
    return redirect(url_for("students.getStudents"))

@students.route("/students/delete/<int:studentID>", methods = ["POST"])
def deleteStudent(studentID):
    """
    Delete students by id from database
    """
    query = f"DELETE FROM students WHERE id = {studentID};"
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        flash("Student deleted successfully", "primary")
    except Exception as e:
        flash(str(e), "danger")
    return redirect(url_for("students.getStudents"))
