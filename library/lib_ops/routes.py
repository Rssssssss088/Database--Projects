from flask import Flask, render_template, request, flash, redirect, url_for, abort
from flask_mysqldb import MySQL
from library import db  # initially created by __init__.py, need to be used here
from library.copies.forms import SelectCopy, CreateCopy
from library.copies import copies



@copies.route("/copies/<username>", methods=["GET", ])
def RenderCopies(username):
    try:
        # Establish a connection to the database
        connection = db.connection
        cur = connection.cursor()

        # Execute a sample query
        cur.execute("select r.reservation_id, b.title, r.copy_id, r.reservation_date, r.deadline_date, r.cancellation_date from books b join copies c on b.isbn=c.isbn join reservations r on c.copy_id=r.copy_id and c.school_id=r.school_id where r.username='{}';".format(username))
        column_names = [i[0] for i in cur.description]
        results = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()

        # Pass the results to the template
        return render_template("user_reservations.html", reservations=results)


    except Exception as e:
        return 'Failed to connect to the database: {}'.format(str(e))

    return 'Failed to connect to the database.'


@copies.route("/copies/<username>/<isbn>", methods=["GET", "POST"])
def UserReservation(username, isbn):
    if request.method == "GET":
        try:
            connection = db.connection
            cur = connection.cursor()
            res = None
            cur.execute(
                "select c.copy_id from copies c join user u on u.school_id=c.school_id where isbn='{}' and available=true and username ='{}';"
                .format(isbn, username)
            )
            column_names = [i[0] for i in cur.description]
            results = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
            cur.close()

            # Pass the results to the template
            return render_template("user_copies_to_reserve.html", reservations=results)
            if res:
                result = dict(zip(column_names, res))
            copy_id = result.get("copy_id")
            school_id = result.get("school_id")
            cur.close()
            return redirect(url_for("reservations.Between",
                                    username=username, copy_id=copy_id, school_id=school_id, isbn=isbn))
        except Exception as e:
            flash(str(e), "danger")

    else:
        try:
            connection = db.connection
            cur = connection.cursor()
            cur.execute(
                "select max(reservation_id) from reservations where username='{}';"
                .format(username)
            )
            rental_id = cur.fetchone()  # Fetch the result once
            if rental_id:
                flash(f"Reservation ID = {rental_id[0]},{username}", "success")
                return redirect(url_for("reservations.ShowReservations",
                                        username=username))  # Redirect to the reservations/<username> route

            else:
                flash("No reservation ID found. A weird error happened, try again", "error")
                return redirect(url_for("reservations.ShowReservations",
                                        username=username))
            cur.close()
        except Exception as e:
             flash(str(e), "danger")
    flash("An unknown error occurred")
    return redirect(url_for("reservations.ShowReservations",
                            username=username))

@copies.route("/between/<username>/<copy_id>/<school_id>/<isbn>", methods = ["GET"])
def Between(username, copy_id, school_id, isbn):
    connection = db.connection
    cur = connection.cursor()
    cur.execute(
        "insert into reservations (username, copy_id, school_id, reservation_date) values ('{}', {}, '{}', curdate());"
        .format(username, copy_id, school_id)
    )
    flash("Reservation Successful", "success")
    cur.close()
    return redirect(url_for("reservations.UserReservation",
                            username=username, isbn=isbn, methods="GET"))


@copies.route("/copy/create/<school_id>", methods = ["GET", "POST"])
def CopyCreate(school_id):

    """
    Create new user in the database
    """

    form = CreateCopy()

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
        form = CreateCopy()
        newCopy = form.__dict__
        query = "INSERT INTO copies (copy_id, school_id, isbn) VALUES ('{}','{}','{}');" \
                 .format(
            newCopy['copy_id'].data,
            school_id,
            newCopy['isbn'].data,
        )

        try:
            cur = db.connection.cursor()
            cur.execute(query)
            db.connection.commit()
            cur.close()
            flash("Copy inserted successfully", "success")
            return render_template("lib_op_copy.html", pageTitle="Copy Insert", form=form, school_id=school_id)
        except Exception as e:  ## OperationalError
            flash(str(e), "danger")
    else:
        try:
            return render_template("lib_op_copy.html", pageTitle="Copy Insert", form=form, school_id=school_id)
        except Exception as e:  ## OperationalError
            flash(str(e), "danger")
    flash("Failed to insert copy", "danger")
    return render_template("lib_op_copy.html", pageTitle="Copy Insert", form=form, school_id=school_id)


@copies.route("/user/delete/<int:username>", methods = ["POST"])
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