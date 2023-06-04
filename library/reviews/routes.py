from flask import Flask, render_template, request, flash, redirect, url_for, abort
from flask_mysqldb import MySQL
from library import db ## initially created by __init__.py, need to be used here
from library.reviews.forms import CreateReview
from library.user.forms import UserSearch
from library.books_category.forms import CategorySearch
from library.reviews import reviews

@reviews.route("/reviews")
def ApproveReviews():
    """
    Retrieve students from database
    """
    try:
        form = CreateReview()
        cur = db.connection.cursor()
        cur.execute("SELECT * FROM reviews")
        column_names = [i[0] for i in cur.description]
        reviews = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        return render_template("reviews.html", reviews = reviews, pageTitle = "Reviews Page")
    except Exception as e:
        ## if the connection to the database fails, return HTTP response 500
        flash(str(e), "danger")
        abort(500)


@reviews.route("/reviews/<school_id>/<lib_op>")
def LibReviews(school_id, lib_op):
    """
    Retrieve students from database
    """

    try:
        cur = db.connection.cursor()
        cur.execute("SELECT r.review_id, b.title, r.rating, r.comment, r.date, r.approved_by_op FROM reviews r join books b on b.isbn=r.isbn join user u on u.username=r.username where u.school_id='{}' order by r.approved_by_op DESC, r.review_id DESC ;".format(school_id))
        column_names = [i[0] for i in cur.description]
        reviews = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        return render_template("lib_op_reviews.html", reviews = reviews, pageTitle = "Reviews Page", school_id=school_id, lib_op=lib_op)
    except Exception as e:
        ## if the connection to the database fails, return HTTP response 500
        flash(str(e), "danger")
        abort(500)



@reviews.route("/reviews/<username>")
def GetReviews(username):
    """
    Retrieve students from database
    """
    try:
        form = CreateReview()
        cur = db.connection.cursor()
        cur.execute("SELECT r.review_id, r.username, b.title, r.rating, r.comment, r.date, r.approved_by_op FROM reviews r join books b on b.isbn=r.isbn where username='{}';".format(username))
        column_names = [i[0] for i in cur.description]
        reviews = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        return render_template("reviews.html", reviews = reviews, pageTitle = "Reviews Page", username=username)
    except Exception as e:
        ## if the connection to the database fails, return HTTP response 500
        flash(str(e), "danger")
        abort(500)


@reviews.route("/reviews/show/<username>/<isbn>", methods=['GET'])
def ShowReviews(username, isbn):
    """
    Retrieve students from database
    """
    try:
        form = CreateReview()
        cur = db.connection.cursor()
        cur.execute("SELECT r.review_id, r.username, b.title, r.rating, r.comment, r.date FROM reviews r join books b on b.isbn=r.isbn where r.isbn='{}' and r.approved_by_op is not Null;".format(isbn))
        column_names = [i[0] for i in cur.description]
        reviews = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        return render_template("book_reviews.html", reviews = reviews, pageTitle = "Reviews Page", username=username, isbn=isbn)
    except Exception as e:
        ## if the connection to the database fails, return HTTP response 500
        flash(str(e), "danger")
        abort(500)

@reviews.route("/lib_op/review/stats/<username>/", methods=['GET', 'POST'])
def StatsReviews(username):
    form1 = UserSearch()
    form2 = CategorySearch()

    try:
        if (request.method == "POST" and form1.validate_on_submit() and form2.validate_on_submit()):
            form1 = UserSearch()
            form2 = CategorySearch()
            newTerm1 = form1.__dict__
            newTerm2 = form2.__dict__


            if(newTerm1['username'].data!=None):

                connection = db.connection
                cur = connection.cursor()

                # Execute a sample query
                cur.execute("select * from avg_rating_user where username like'%{}%';".format(newTerm1['username'].data))
                ucolumn_names = [i[0] for i in cur.description]
                uresults = [dict(zip(ucolumn_names, entry)) for entry in cur.fetchall()]
                cur.execute(
                    "select * from avg_rating_category;")
                ccolumn_names = [i[0] for i in cur.description]
                cresults = [dict(zip(ccolumn_names, entry)) for entry in cur.fetchall()]
                cur.close()

            else:
                # Establish a connection to the database
                form1 = UserSearch()
                form2 = CategorySearch()
                connection = db.connection
                cur = connection.cursor()

                # Execute a sample query
                cur.execute("select * from avg_rating_user;")
                ucolumn_names = [i[0] for i in cur.description]
                uresults = [dict(zip(ucolumn_names, entry)) for entry in cur.fetchall()]
                cur.execute("select * from avg_rating_category where category like '%{}%';".format(newTerm2['category'].data))
                ccolumn_names = [i[0] for i in cur.description]
                cresults = [dict(zip(ccolumn_names, entry)) for entry in cur.fetchall()]
                cur.close()

            # Pass the results to the template
            return render_template("lib_op_reviews_stats.html", cresults=cresults, uresults=uresults, form1=form1, form2=form2, username=username)

        else:
            form1 = UserSearch()
            form2 = CategorySearch()
            connection = db.connection
            cur = connection.cursor()

            # Execute a sample query
            cur.execute("select * from avg_rating_user;")
            ucolumn_names = [i[0] for i in cur.description]
            uresults = [dict(zip(ucolumn_names, entry)) for entry in cur.fetchall()]
            cur.execute("select * from avg_rating_category;")
            ccolumn_names = [i[0] for i in cur.description]
            cresults = [dict(zip(ccolumn_names, entry)) for entry in cur.fetchall()]
            cur.close()

            # Pass the results to the template
            return render_template("lib_op_reviews_stats.html", cresults=cresults, uresults=uresults, form1=form1, form2=form2, username=username)


    except Exception as e:
        return 'Failed to connect to the database: {}'.format(str(e))

    return 'Failed to connect to the database.'


@reviews.route("/review/create/<username>/<isbn>", methods = ["GET", "POST"]) ## "GET" by default
def ReviewCreate(username, isbn):

    """
    Create new user in the database
    """


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

    form = CreateReview()


    ## when the form is submitted
    if(request.method == "POST" and form.validate_on_submit()):
        form = CreateReview()
        newReview = form.__dict__
        query = "INSERT INTO reviews(username, isbn, rating, comment, date) VALUES ('{}', '{}', '{}', '{}', curdate());"\
            .format(username,
                    isbn,
                    newReview['rating'].data,
                    newReview['comment'].data
                    )
        try:
            cur = db.connection.cursor()
            cur.execute(query)
            db.connection.commit()
            cur.close()
            flash("Review inserted successfully", "success")
            return redirect(url_for("reviews.GetReviews", username=username))
        except Exception as e: ## OperationalError
            flash(str(e), "danger")
    else:
        query = "select title from books where isbn='{}';" \
            .format(isbn)
        try:
            cur = db.connection.cursor()
            cur.execute(query)
            column_names = [i[0] for i in cur.description]
            title_data = cur.fetchone()  # Fetch the result once
            if title_data:
                title = dict(zip(column_names, title_data))
            db.connection.commit()
            cur.close()
            return render_template("create_review.html", pageTitle="Create review", form=form, username=username,
                                   isbn=isbn, title=title)
        except Exception as e:  ## OperationalError
            flash(str(e), "danger")
    flash("WTF", "danger")
    return(render_template("landing.html"))

@reviews.route("/students/update/<int:studentID>", methods = ["POST"])
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

@reviews.route("/reviews/delete/<int:review_id>/<username>", methods = ["POST"])
def deleteReview(review_id, username):
    """
    Delete students by id from database
    """
    query = f"DELETE FROM reviews WHERE review_id = {review_id};"
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        flash("Review deleted successfully", "primary")
    except Exception as e:
        flash(str(e), "danger")
    return redirect(url_for("reviews.GetReviews", username=username))


@reviews.route("/lib_op/approve/review/<school_id>/<lib_op>/<int:review_id>", methods = ["POST"])
def OpApproveReview(school_id, lib_op, review_id):
    query = "UPDATE reviews SET approved_by_op = '{}' WHERE review_id={};".format(lib_op, review_id)
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        flash(f"Review {review_id} approved successfully", "success")
    except Exception as e:
        flash(str(e), "danger")
    return redirect(url_for("reviews.LibReviews", lib_op=lib_op, school_id=school_id))


@reviews.route("/lib_op/disapprove/review/<school_id>/<lib_op>/<int:review_id>", methods=["POST"])
def OpDisapproveReview(school_id, lib_op, review_id):
    query = "UPDATE reviews SET approved_by_op = NULL WHERE review_id={};".format(review_id)
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        flash(f"Review {review_id} disapproved successfully", "success")
    except Exception as e:
        flash(str(e), "danger")
    return redirect(url_for("reviews.LibReviews", lib_op=lib_op, school_id=school_id))


@reviews.route("/lib_op/delete/review/<school_id>/<lib_op>/<int:review_id>", methods = ["POST"])
def OpDeleteReview(school_id, lib_op, review_id):
    """
    Delete students by id from database
    """
    query = f"DELETE FROM reviews WHERE review_id = {review_id};"
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        flash(f"Review {review_id} deleted successfully", "primary")
    except Exception as e:
        flash(str(e), "danger")
    return redirect(url_for("reviews.LibReviews", lib_op=lib_op, school_id=school_id))
