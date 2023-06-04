## This file is ran automatically the first time a Python program imports the package library
from flask import Flask
from flask_mysqldb import MySQL
from library.grade import grade
from library.user import user
from library.books import books
from library.school_units import school_units
from library.reviews import reviews
from library.rentals import rentals
from library.reservations import reservations
from library.books_category import books_category
from library.books_author import books_author
from library.books_keyword import books_keyword
from library.students import students
from library.professors import professors
from library.admins import admins
from library.lib_ops import lib_ops
from library.copies import copies


## __name__ is the name of the module. When running directly from python, it will be 'library'
## Outside of this module, as in run.py, it is '__main__' by default
## Create an instance of the Flask class to be used for request routing
app = Flask(__name__)

@app.template_filter('enumerate_categories')
def enumerate_categories(categories):
    enumerated_categories = [(index, category) for index, category in enumerate(categories)]
    return Markup(enumerated_categories)

## configuration of database

app.config["MYSQL_USER"] = 'root'
app.config["MYSQL_PASSWORD"] = ''
app.config["MYSQL_DB"] = 'library'
app.config["MYSQL_HOST"] = 'localhost'
app.config["SECRET_KEY"] = 'cba2ffe8cc6afe3219157e759044f6cc9d22c5f3df0fd614d63bb2ee4862d71a' ## secret key for sessions (signed cookies). Flask uses it to protect the contents of the user session against tampering.
app.config["WTF_CSRF_SECRET_KEY"] = 'cba2ffe8cc6afe3219157e759044f6cc9d22c5f3df0fd614d63bb2ee4862d71a' ## token for csrf protection of forms.
## secret keys can be generated by secrets.token_hex()

## initialize database connection object
db = MySQL(app)

## routes must be imported after the app object has been initialized
from library import routes
from library.admins import routes
from library.books import routes
from library.user import routes
from library.books import routes
from library.school_units import routes
from library.reviews import routes
from library.rentals import routes
from library.reservations import routes
from library.books_category import routes
from library.books_author import routes
from library.books_keyword import routes
from library.students import routes
from library.professors import routes
from library.admins import routes
from library.lib_ops import routes
from library.copies import routes

from library.grade import routes



app.register_blueprint(user)
app.register_blueprint(books)
app.register_blueprint(school_units)
app.register_blueprint(reviews)
app.register_blueprint(rentals)
app.register_blueprint(reservations)
app.register_blueprint(books_category)
app.register_blueprint(books_author)
app.register_blueprint(books_keyword)
app.register_blueprint(students)
app.register_blueprint(professors)
app.register_blueprint(admins)
app.register_blueprint(lib_ops)
app.register_blueprint(copies)

