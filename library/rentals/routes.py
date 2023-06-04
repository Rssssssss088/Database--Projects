from flask import Flask, render_template, request, flash, redirect, url_for, abort
from flask_mysqldb import MySQL
from library import db  # initially created by __init__.py, need to be used here
from library.user.forms import UserCreate, UserLogin, UserSearch
from library.rentals import rentals
from library.professors.forms import ProfessorCreate
from library.rentals.forms import CreateRental, ReturnRental


from traceback import print_exc

@rentals.route("/rentals/<username>", methods=["GET"])
def ShowRentals(username):
    try:
        # Establish a connection to the database
        connection = db.connection
        cur = connection.cursor()

        # Execute a sample query
        cur.execute("select r.rental_id, b.title, r.copy_id, r.rental_date, r.deadline_date, r.return_date from books b join copies c on b.isbn=c.isbn join rentals r on c.copy_id=r.copy_id and c.school_id=r.school_id where r.username='{}' order by rental_id desc;".format(username))
        column_names = [i[0] for i in cur.description]
        results = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()

        # Pass the results to the template
        return render_template("user_rentals.html", rentals=results)


    except Exception as e:
        return 'Failed to connect to the database: {}'.format(str(e))

    return 'Failed to connect to the database.'


@rentals.route('/lib_op/rental/make/<school_id>/<lib_op>', methods=['GET', 'POST'])
def MakeRental(school_id, lib_op):

    """
    Create new user in the database
    """

    form = CreateRental()

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
        form = CreateRental()
        newRental = form.__dict__
        query1 = "INSERT INTO rentals (username, copy_id, school_id, rental_date, approved_by_op) VALUES (%s, %s, %s, curdate(), '{}')".format(
            lib_op)

        try:
            cur = db.connection.cursor()
            cur.execute(query1, (newRental['username'].data, newRental['copy_id'].data, school_id))
            num_rows_affected = cur.rowcount
            if num_rows_affected == 0:
                flash("Failed to make rental. Check if everything is filled properly in the form", "danger")
                return render_template("lib_op_make_rental.html", pageTitle="Rental Insert", form=form,
                                       school_id=school_id, lib_op=lib_op)
            db.connection.commit()
            cur.close()
            flash("Rental Completed successfully", "success")
            return redirect(url_for("rentals.OpShowRentals", pageTitle="Rentals", school_id=school_id, lib_op=lib_op))
        except Exception as e:  ## OperationalError
            flash(str(e), "danger")

    else:
        try:
            return render_template("lib_op_make_rental.html", pageTitle="Make Rental", form=form, school_id=school_id, lib_op=lib_op)
        except Exception as e:  ## OperationalError
            flash(str(e), "danger")
    flash("Failed to make rental. Check if the form is filled properly or if the user is from the same school", "danger")
    return render_template("lib_op_make_rental.html", pageTitle="Copy Insert", form=form, school_id=school_id)

@rentals.route('/lib_op/rental/return/<school_id>/<lib_op>', methods=['GET', 'POST'])
def RentalReturn(school_id, lib_op):

    """
    Create new user in the database
    """

    form = ReturnRental()

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
        form = ReturnRental()
        newReturn = form.__dict__
        query = "update rentals set return_date=curdate() where rental_id=%s and school_id=%s;"

        try:
            cur = db.connection.cursor()
            cur.execute(query, (newReturn['rental_id'].data, school_id))
            num_rows_affected = cur.rowcount
            if num_rows_affected == 0:
                flash("Failed to return. Check the rental id and the user's school", "danger")
                return render_template("lib_op_return_rental.html", pageTitle="Rental Insert", form=form,
                                       school_id=school_id, lib_op=lib_op)
            db.connection.commit()
            cur.close()
            flash("Return Completed successfully", "success")
            return redirect(url_for("rentals.OpShowRentals", pageTitle="Rentals", school_id=school_id, lib_op=lib_op))
        except Exception as e:  ## OperationalError
            flash(str(e), "danger")

    else:
        try:
            return render_template("lib_op_return_rental.html", pageTitle="Make Rental", form=form, school_id=school_id, lib_op=lib_op)
        except Exception as e:  ## OperationalError
            flash(str(e), "danger")
    flash("Failed to make rental. Check if the form is filled properly", "danger")
    return render_template("lib_op_return_rental.html", pageTitle="Copy Insert", form=form, school_id=school_id)


@rentals.route("/lib_op/rentals/<school_id>", methods=["GET", "POST"])
def OpShowRentals(school_id):

    form = UserSearch()

    try:
        if (request.method == "POST" and form.validate_on_submit()):
            form = UserSearch()
            newTerm = form.__dict__
            connection = db.connection
            cur = connection.cursor()
            # Execute a sample query
            cur.execute(
                "select r.rental_id, r.username, b.title, r.copy_id, r.rental_date, r.deadline_date, r.return_date from books b join copies c on b.isbn=c.isbn join rentals r on c.copy_id=r.copy_id and c.school_id=r.school_id join user u on u.username=r.username where r.school_id='{}' and u.penalty=FALSE and r.username like '%{}%' order by rental_id desc;".format(
                    school_id, newTerm['username'].data))
            column_names = [i[0] for i in cur.description]
            results = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
            cur.close()

            # Pass the results to the template
            return render_template("lib_op_rentals.html", rentals=results, school_id=school_id, form=form)

        else:
            form = UserSearch()
            connection = db.connection
            cur = connection.cursor()

            # Execute a sample query
            cur.execute(
                "select r.rental_id, r.username, b.title, r.copy_id, r.rental_date, r.deadline_date, r.return_date from books b join copies c on b.isbn=c.isbn join rentals r on c.copy_id=r.copy_id and c.school_id=r.school_id join user u on u.username=r.username where r.school_id='{}' and u.penalty=FALSE order by rental_id desc;".format(
                    school_id))
            column_names = [i[0] for i in cur.description]
            results = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
            cur.close()

            # Pass the results to the template
            return render_template("lib_op_rentals.html", rentals=results, school_id=school_id, form=form)


    except Exception as e:
        return 'Failed to connect to the database: {}'.format(str(e))

    return 'Failed to connect to the database.'


@rentals.route("/user/login", methods = ["GET", "POST"]) ## "GET" by default
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
    if(request.method == "POST" and form.validate_on_submit()):
        newUser = form.__dict__
        query = "select first_name, last_name, school_id, can_rent, can_reserve, penalty, approved_by_op from user where username='{}' and password = '{}';".format(newUser['username'].data,newUser['password'].data)
        try:
            cur = db.connection.cursor()
            cur.execute(query)
            column_names = [i[0] for i in cur.description]
            credentials = dict(zip(column_names, cur.fetchone()))
            cur.close()
            if not credentials:
                flash("Couldn't find user", "danger")
            elif credentials.get("approved_by_op") is not None :
                flash("Logged In", "success")
                return render_template("user_main.html", pageTitle = "User Main", credentials = credentials)
            else:
                flash("Oops... Seems like you haven't been accepted yet. Please try again later!", "danger")
        except Exception as e: ## OperationalError
            flash(str(e), "danger")

    ## else, response for GET request
    return render_template("login.html", pageTitle = "Login", form = form)

@rentals.route("/user/update/<int:username>", methods = ["POST"])
def updateUser(username):
    """
    Update a user in the database, by username
    """
    form = UserForm() ## see createUser for explanation
    updateData = form.__dict__
    if(form.validate_on_submit()):
        query = "UPDATE user SET first_name = '{}', last_name = '{}', email = '{}' WHERE username = {};".format(updateData['first_name'].data, updateData['last_name'].data, updateData['email'].data, username)
        try:
            cur = db.connection.cursor()
            cur.execute(query)
            db.connection.commit()
            cur.close()
            flash("User updated successfully", "success")
        except Exception as e:
            flash(str(e), "danger")
    else:
        for category in form.errors.values():
            for error in category:
                flash(error, "danger")
    return redirect(url_for("user.getUser"))

@rentals.route("/user/delete/<int:username>", methods = ["POST"])
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

@rentals.route("/lib_op/rental/delete/<int:rental_id>/<school_id>", methods = ["POST"])
def OpDeleteReservation(rental_id, school_id):
    """
    Delete user by username from database
    """
    query = f"delete from rentals WHERE rental_id = {rental_id};"
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        flash(f"Rental {rental_id} deleted successfully", "primary")
    except Exception as e:
        flash(str(e), "danger")
    return redirect(url_for("rentals.OpShowRentals", school_id=school_id))


@rentals.route("/lib_op/rentals/black-list/<school_id>", methods=['GET', 'POST'])
def BlackList(school_id):

    form=UserSearch()

    try:
        if (request.method == "POST" and form.validate_on_submit()):
            form = UserSearch()
            newTerm = form.__dict__
            connection = db.connection
            cur = connection.cursor()
            # Execute a sample query
            cur.execute(
                "select * from bad_rentals where school_id='{}'and (username like '%{}%' or first_name like '%{}%' or last_name like '%{}%' or days_delayed like '%{}%');"
                .format(school_id,
                    newTerm['username'].data,
                    newTerm['username'].data,
                    newTerm['username'].data,
                    newTerm['username'].data
                    )
            )
            column_names = [i[0] for i in cur.description]
            results = [dict(zip(column_names, entry)) for entry in cur.fetchall()]

            # Establish a connection to the database

            return render_template("lib_op_bad_rentals.html", results=results, form=form)

        else:
            form = UserSearch()
            connection = db.connection
            cur = connection.cursor()

            # Execute a sample query
            cur.execute("select * from bad_rentals where school_id='{}';".format(school_id))
            column_names = [i[0] for i in cur.description]
            results = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
            cur.close()

            # Pass the results to the template
            return render_template("lib_op_bad_rentals.html", results = results, form=form)


    except Exception as e:
        return 'Failed to connect to the database: {}'.format(str(e))

    return 'Failed to connect to the database.'
