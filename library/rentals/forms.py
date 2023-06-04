from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, SelectField, IntegerField, SearchField, URLField, EmailField
from wtforms.validators import DataRequired, Email, NumberRange


class CreateRental(FlaskForm):

    username = StringField(label="*User's Username", validators=[DataRequired(message="Username is a required field.")])

    copy_id = IntegerField(label="*Copy ID", validators=[DataRequired(message="Copy ID is a required field.")])

    title = StringField(label="Title")

    submit = SubmitField("Rent")


class ReturnRental(FlaskForm):

    rental_id = IntegerField(label="*Rental ID", validators=[DataRequired(message="Copy ID is a required field.")])

    submit = SubmitField("Return")



