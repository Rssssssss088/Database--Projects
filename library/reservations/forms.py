from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, SelectField, IntegerField, SearchField, URLField, EmailField
from wtforms.validators import DataRequired, Email, NumberRange


class AddReservation(FlaskForm):


    reservation_id = IntegerField(label="*Reservation ID", validators=[DataRequired(message="Reservation ID is a required field.")])

    submit = SubmitField("Rent")





