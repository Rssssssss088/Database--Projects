from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, SelectField, IntegerField, BooleanField
from wtforms.validators import DataRequired, Email, NumberRange

class ProfessorCreate(FlaskForm):

    specialty = StringField(label = "Specialty", validators = [DataRequired(message = "Specialty is a required field.")])

    lib_op = BooleanField(label= "Apply for lib_op")
