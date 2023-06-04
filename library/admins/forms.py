from flask_wtf import FlaskForm
from wtforms import SubmitField, SelectField, DateField
from datetime import datetime

class Search311(FlaskForm):

    date = DateField(label='Select month and year, day is not important')

    search = SubmitField("Search...")


class Search312(FlaskForm):
    categories = SelectField(label = "Category")

    search = SubmitField('Search...')

