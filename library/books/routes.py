from flask import Flask, render_template, request, flash, redirect, url_for, abort
from flask_mysqldb import MySQL
from library import db  # initially created by __init__.py, need to be used here
from library.books.forms import BookSearch, BookCreate, CategoriesForm
from library.books import books

@books.route("/books/<username>/<school_id>", methods=["GET", "POST"])
def ShowBooks(username, school_id):

    form = BookSearch()

    try:
        if (request.method == "POST" and form.validate_on_submit()):
            form = BookSearch()
            newTerm = form.__dict__
            # Establish a connection to the database
            connection = db.connection
            cur = connection.cursor()

            # Execute a sample query
            cur.execute("select b.isbn, b.title, GROUP_CONCAT(distinct c.category SEPARATOR ', ') as categories, GROUP_CONCAT(distinct k.keyword SEPARATOR ', ') as keywords, GROUP_CONCAT(distinct CONCAT(a.author_first_name, ' ', a.author_last_name) SEPARATOR ', ') AS authors, b.summary, b.pages, b.publisher, b.image, b.language from books b left join books_author a on b.isbn=a.isbn join books_category c on c.isbn=b.isbn left join copies cop on cop.isbn=b.isbn join books_keyword k on k.isbn=b.isbn where cop.school_id='{}' and (b.title  like '%{}%' or author_first_name like '%{}%'or author_last_name like '%{}%' or category like '%{}%') GROUP BY b.isbn, b.title;"\
                .format(school_id, newTerm['term'].data, newTerm['term'].data, newTerm['term'].data, newTerm['term'].data))
            column_names = [i[0] for i in cur.description]
            results = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
            cur.close()

            # Pass the results to the template
            return render_template("user_books.html", books=results,form=form, username=username,)
        else:
            form = BookSearch()
            # Establish a connection to the database
            connection = db.connection
            cur = connection.cursor()

            # Execute a sample query
            cur.execute(
                "SELECT b.isbn, b.title, GROUP_CONCAT(DISTINCT c.category SEPARATOR ', ') AS categories, GROUP_CONCAT(DISTINCT k.keyword SEPARATOR ', ') AS keywords, GROUP_CONCAT(DISTINCT CONCAT(a.author_first_name, ' ', a.author_last_name) SEPARATOR ', ') AS authors, b.summary, b.pages, b.publisher, b.image, b.language FROM books b left JOIN books_author a ON b.isbn = a.isbn JOIN books_category c ON c.isbn = b.isbn LEFT JOIN books_keyword k ON k.isbn = b.isbn join copies cop on cop.isbn=b.isbn WHERE cop.school_id = '{}' GROUP BY b.isbn, b.title;"\
                .format(school_id))
            column_names = [i[0] for i in cur.description]
            results = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
            cur.close()

            # Pass the results to the template
            return render_template("user_books.html", books=results, form=form, username=username)

    except Exception as e:
        return 'Failed to connect to the database: {}'.format(str(e))

    return 'Failed to connect to the database.'


@books.route("/book/create/<username>", methods=["GET", "POST"])
def createBook(username):
    """
    Create a new book in the database
    """
    form = BookCreate()
    form_c=CategoriesForm()


    if request.method == "POST":
        newBook = form.__dict__
        query1 = "INSERT INTO books (isbn, title, publisher, pages, summary, image, language) VALUES ('{}', '{}', '{}', '{}', '{}', '{}', '{}');"\
            .format(
                newBook['isbn'].data,
                newBook['title'].data,
                newBook['publisher'].data,
                newBook['pages'].data,
                newBook['summary'].data,
                newBook['image'].data,
                newBook['language'].data
            )

        try:
            cur = db.connection.cursor()
            cur.execute(query1)
            categories = form_c.categories.data
            for category in categories:
                query2 = "INSERT INTO books_category (isbn, category) VALUES ('{}', '{}');" \
                    .format(
                        newBook['isbn'].data,
                        category
                    )
                cur.execute(query2)
                flash("Inserted Category", "success")
            keywords = form.keywords.data
            for keyword in keywords:
                query3 = "INSERT INTO books_keyword (isbn, keyword) VALUES ('{}', '{}');" \
                    .format(
                    newBook['isbn'].data,
                    keyword['keyword']
                )
                cur.execute(query3)
                flash("Inserted Keyword", "success")
            authors = form.authors.data
            for author in authors:
                query4 = "INSERT INTO books_author (isbn, author_first_name, author_middle_name, author_last_name) VALUES ('{}', '{}', '{}', '{}');" \
                    .format(
                        newBook['isbn'].data,
                        author['author_first_name'],
                        author['author_mid_name'],
                        author['author_last_name'],

                    )
                cur.execute(query4)
                flash("Inserted Author", "success")
            db.connection.commit()
            cur.close()

            flash("Book inserted successfully", "success")
            return redirect(url_for("books.OpBooks", pageTitle="Operator Main", username=username))
        except Exception as e:
            flash(str(e), "danger")

    return render_template("create_book.html", pageTitle="Create Book", form=form, form_c=form_c, username=username)


@books.route("/lib_op/book/edit/<isbn>/<username>", methods = ["GET", "POST"]) ## "GET" by default
def updateProfessor(isbn, username):

    """
    Create new user in the database
    """

    form = BookCreate()
    form_c = CategoriesForm()

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

    form = BookCreate()
    form_c = CategoriesForm()
    cur = db.connection.cursor()
    cur.execute("select * from books where isbn='{}';".format(isbn))
    user_data = cur.fetchone()
    form.isbn.data = user_data[0]
    form.title.data = user_data[1]
    form.publisher.data = user_data[2]
    form.pages.data = user_data[3]
    form.summary.data = user_data[4]
    form.image.data = user_data[5]
    form.language.data = user_data[6]


    ## each tuple in the above list is in the format (id, full name),
    ## and will be rendered in html as an <option> of the <select>
    ## element, with value = id and content = full_name
    cur.close()

    ## when the form is submitted
    if (request.method == "POST" and form.validate_on_submit()):
        form = BookCreate()
        form_c = CategoriesForm()
        newBook = form.__dict__

        # Update the existing book record if it already exists
        query1 = "UPDATE books SET title='{}', publisher='{}', pages='{}', summary='{}', image='{}', language='{}' WHERE isbn='{}';" \
            .format(
            newBook['title'].data,
            newBook['publisher'].data,
            newBook['pages'].data,
            newBook['summary'].data,
            newBook['image'].data,
            newBook['language'].data,
            isbn
        )

        try:
            cur = db.connection.cursor()
            cur.execute(query1)

            # Delete existing category records for the book
            query2 = "DELETE FROM books_category WHERE isbn='{}';".format(isbn)
            cur.execute(query2)

            categories = form_c.categories.data
            for category in categories:
                # Insert new category records for the book
                query3 = "INSERT INTO books_category (isbn, category) VALUES ('{}', '{}');" \
                    .format(isbn, category)
                cur.execute(query3)
                flash("Updated Category", "success")

            # Delete existing keyword records for the book
            query4 = "DELETE FROM books_keyword WHERE isbn='{}';".format(isbn)
            cur.execute(query4)

            keywords = form.keywords.data
            for keyword in keywords:
                # Insert new keyword records for the book
                query5 = "INSERT INTO books_keyword (isbn, keyword) VALUES ('{}', '{}');" \
                    .format(isbn, keyword['keyword'])
                cur.execute(query5)
                flash("Updated Keyword", "success")

            # Delete existing author records for the book
            query6 = "DELETE FROM books_author WHERE isbn='{}';".format(isbn)
            cur.execute(query6)

            authors = form.authors.data
            for author in authors:
                # Insert new author records for the book
                query7 = "INSERT INTO books_author (isbn, author_first_name, author_middle_name, author_last_name) VALUES ('{}', '{}', '{}', '{}');" \
                    .format(isbn, author['author_first_name'], author['author_mid_name'], author['author_last_name'])
                cur.execute(query7)
                flash("Updated Author", "success")

            db.connection.commit()
            cur.close()

            flash("Book updated successfully", "success")
            return redirect(url_for("books.OpBooks", pageTitle="Operator Main", username=username))
        except Exception as e:
            flash(str(e), "danger")

    return render_template("create_book.html", pageTitle="Create Book", form=form, form_c=form_c, username=username)

@books.route("/user/update/<int:username>", methods = ["GET"])
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

@books.route("/user/delete/<int:username>", methods = ["POST"])
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

@books.route("/lib_op/books/<username>", methods=["GET", "POST"])
def OpBooks(username):
    form = BookSearch()

    try:
        if (request.method == "POST" and form.validate_on_submit()):
            form = BookSearch()
            newTerm = form.__dict__
            # Establish a connection to the database
            connection = db.connection
            cur = connection.cursor()

            # Execute a sample query
            cur.execute(
                "select b.isbn, b.title, GROUP_CONCAT(distinct c.category SEPARATOR ', ') as categories, GROUP_CONCAT(distinct k.keyword SEPARATOR ', ') as keywords, GROUP_CONCAT(distinct CONCAT(a.author_first_name, ' ', a.author_last_name) SEPARATOR ', ') AS authors, availability, b.summary, b.pages, b.publisher, b.image, b.language from books b join book_availability ba on ba.isbn=b.isbn join books_author a on b.isbn=a.isbn join books_category c on c.isbn=b.isbn left join copies cop on cop.isbn=b.isbn join books_keyword k on k.isbn=b.isbn where ( b.title  like '%{}%' or author_first_name like '%{}%'or author_last_name like '%{}%' or category like '%{}%' or keyword like '%{}%' or availability like '%{}%') GROUP BY b.isbn, b.title;" \
                .format(newTerm['term'].data, newTerm['term'].data, newTerm['term'].data,
                        newTerm['term'].data,newTerm['term'].data,newTerm['term'].data))
            column_names = [i[0] for i in cur.description]
            results = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
            cur.close()

            # Pass the results to the template
            return render_template("lib_op_books.html", books=results, form=form, username=username)
        else:
            form = BookSearch()
            # Establish a connection to the database
            connection = db.connection
            cur = connection.cursor()

            # Execute a sample query
            cur.execute(
                "SELECT b.isbn, b.title, GROUP_CONCAT(DISTINCT c.category SEPARATOR ', ') AS categories, GROUP_CONCAT(DISTINCT k.keyword SEPARATOR ', ') AS keywords, GROUP_CONCAT(DISTINCT CONCAT(a.author_first_name, ' ', a.author_last_name) SEPARATOR ', ') AS authors, availability, b.summary, b.pages, b.publisher, b.image, b.language FROM books b join book_availability ba on ba.isbn=b.isbn JOIN books_author a ON b.isbn = a.isbn JOIN books_category c ON c.isbn = b.isbn LEFT JOIN copies cop ON cop.isbn = b.isbn JOIN books_keyword k ON k.isbn = b.isbn GROUP BY b.isbn, b.title;")
            column_names = [i[0] for i in cur.description]
            results = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
            cur.close()

            # Pass the results to the template
            return render_template("lib_op_books.html", books=results, form=form, username=username)

    except Exception as e:
        return 'Failed to connect to the database: {}'.format(str(e))

    return 'Failed to connect to the database.'



