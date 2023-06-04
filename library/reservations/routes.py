from flask import Flask, render_template, request, flash, redirect, url_for, abort
from flask_mysqldb import MySQL
from library import db  # initially created by __init__.py, need to be used here
from library.user.forms import UserCreate, UserLogin, UserSearch
from library.reservations import reservations
from library.reservations.forms import AddReservation

from library.professors.forms import ProfessorCreate
from library.copies.forms import SelectCopy

from traceback import print_exc

@reservations.route("/reservations/<username>", methods=["GET"])
def ShowReservations(username):
    try:
        # Establish a connection to the database
        connection = db.connection
        cur = connection.cursor()

        # Execute a sample query
        cur.execute("select r.reservation_id, b.title, r.copy_id, r.reservation_date, r.deadline_date, r.cancellation_date from books b join copies c on b.isbn=c.isbn join reservations r on c.copy_id=r.copy_id and c.school_id=r.school_id where r.username='{}' order by r.reservation_id DESC;".format(username))
        column_names = [i[0] for i in cur.description]
        results = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()

        # Pass the results to the template
        return render_template("user_reservations.html", reservations=results, username=username)


    except Exception as e:
        return 'Failed to connect to the database: {}'.format(str(e))

    return 'Failed to connect to the database.'


@reservations.route("/lib_op/reservations/<school_id>", methods=["GET", "POST"])
def OpReservations(school_id):

    form = UserSearch()

    try:
        if (request.method == "POST" and form.validate_on_submit()):
            form = UserSearch()
            newTerm = form.__dict__
        # Establish a connection to the database
            connection = db.connection
            cur = connection.cursor()
            cur.execute("select r.reservation_id, r.username, b.title, r.copy_id, r.reservation_date, r.deadline_date, r.cancellation_date from books b join copies c on b.isbn=c.isbn join reservations r on c.copy_id=r.copy_id and c.school_id=r.school_id where r.school_id='{}' and username like '%{}%' order by r.reservation_id DESC;".format(school_id, newTerm['username'].data))
            column_names = [i[0] for i in cur.description]
            results = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
            cur.close()
            return render_template("lib_op_reservations.html", reservations=results, school_id=school_id, form=form)

        else:
            form = UserSearch()
            connection = db.connection
            cur = connection.cursor()
            # Execute a sample query
            cur.execute("select r.reservation_id, r.username, b.title, r.copy_id, r.reservation_date, r.deadline_date, r.cancellation_date from books b join copies c on b.isbn=c.isbn join reservations r on c.copy_id=r.copy_id and c.school_id=r.school_id where r.school_id='{}' order by r.reservation_id DESC;".format(school_id))
            column_names = [i[0] for i in cur.description]
            results = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
            cur.close()

        # Pass the results to the template
        return render_template("lib_op_reservations.html", reservations=results, school_id=school_id, form=form)


    except Exception as e:
        return 'Failed to connect to the database: {}'.format(str(e))

    return 'Failed to connect to the database.'


@reservations.route("/user/update/<username>", methods = ["POST"])
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


@reservations.route("/reservation/delete/<int:reservation_id>/<username>", methods = ["POST"])
def DeleteReservation(reservation_id, username):
    """
    Delete user by username from database
    """
    query = f"update reservations set cancellation_date=curdate() WHERE reservation_id = {reservation_id};"
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        flash(f"Reservation {reservation_id} cancelled successfully", "primary")
    except Exception as e:
        flash(str(e), "danger")
    return redirect(url_for("reservations.ShowReservations", username=username))


@reservations.route("/lib_op/reservation/delete/<int:reservation_id>/<school_id>", methods = ["POST"])
def OpDeleteReservation(reservation_id, school_id):
    """
    Delete user by username from database
    """
    query = f"delete from reservations WHERE reservation_id = {reservation_id};"
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        flash(f"Reservation {reservation_id} cancelled successfully", "primary")
    except Exception as e:
        flash(str(e), "danger")
    return redirect(url_for("reservations.OpReservations", school_id=school_id))


@reservations.route('/lib_op/rental/fulfil-reservation/<school_id>/<username>', methods=['GET', 'POST'])
def ReservationFulfil(school_id, username):

    """
    Create new user in the database
    """

    form = AddReservation()

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
        form = AddReservation()
        newRental = form.__dict__
        query1 = "INSERT INTO rentals (username, copy_id, school_id, rental_date, approved_by_op) values (%s, %s, %s, curdate(), '{}');" \
                 .format(
            username,
        )
        query2 = "select * from reservations where reservation_id={} and cancellation_date is NULL".format(
            newRental['reservation_id'].data,
        )
        try:
            cur = db.connection.cursor()
            cur.execute(query2)
            column_names = [i[0] for i in cur.description]
            credentials_data = cur.fetchone()  # Fetch the result once
            if credentials_data:
                credentials = dict(zip(column_names, credentials_data))
            else:
                flash("Failed to make rental. Check if the reservation id is correct or the reservation is valid","danger")
                return render_template("lib_op_fulfil_reservation.html", pageTitle="Copy Insert", form=form,
                                       school_id=school_id, username=username)

            cur.execute(query1, (credentials['username'], credentials['copy_id'], credentials['school_id']))
            num_rows_affected = cur.rowcount
            if num_rows_affected==0:
                flash("Failed to make rental. Check if the reservation id is correct, the reservation is cancelled or if the user belongs to another school","danger")
                return render_template("lib_op_fulfil_reservation.html", pageTitle="Copy Insert", form=form, school_id=school_id, username=username)
            #cur.execute(query2)
            db.connection.commit()
            cur.close()
            flash("Rental Completed successfully", "success")
            return redirect(url_for("rentals.OpShowRentals", pageTitle="Rentals", school_id=school_id, username=username))
        except Exception as e:  ## OperationalError
            flash(str(e), "danger")
    else:
        try:
            return render_template("lib_op_fulfil_reservation.html", pageTitle="Fulfil Reservation", form=form, school_id=school_id, username=username)
        except Exception as e:  ## OperationalError
            flash(str(e), "danger")
    flash("Failed to make rental. Check if the reservation id is correct, the reservation is cancelled or if the user belongs to another school", "danger")
    return render_template("lib_op_fulfil_reservation.html", pageTitle="Copy Insert", form=form, school_id=school_id)














@reservations.route("/reservations/<username>/<isbn>", methods=["GET", "POST"])
def UserReservation(username, isbn):

    connection = db.connection
    cur = connection.cursor()
    res = None
    cur.execute(
        "select c.copy_id, c.school_id from copies c join user u on u.school_id=c.school_id where isbn='{}' and available=true and username ='{}';"
        .format(isbn, username)
    )
    column_names = [i[0] for i in cur.description]
    res = cur.fetchone()  # Fetch the result once
    if res:
        copy_id = dict(zip(column_names, res))
    else:
        flash("No Copies Available", "danger")
    if request.method == "POST":
        try:
            cur.execute(
                "insert into reservations (username, copy_id, school_id, reservation_date) values ('{}', {}, '{}', curdate());"
                .format(username, copy_id['copy_id'], copy_id['school_id'])
            )
            db.connection.commit()
            cur.close()
            flash("Reservation Successful", "success")
            return redirect(url_for("reservations.ShowReservations",
                                    username=username, pageTitle="Reservations"))
        except Exception as e:
            flash(str(e), "danger")
    flash("Reservation Failed", "danger")
    return redirect(url_for("reservations.ShowReservations",
                            username=username))
