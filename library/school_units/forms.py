from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, SelectField, IntegerField, SearchField, URLField, EmailField
from wtforms.validators import DataRequired, Email, NumberRange


class CreateSchool(FlaskForm):

    school_id = StringField(label="*School ID", validators=[DataRequired(message="Name is a required field.")])

    school_name = StringField(label="*Name", validators=[DataRequired(message="Name is a required field.")])

    street_name = StringField(label="*Street Name", validators=[DataRequired(message="Street's name is a required field.")])

    street_num = IntegerField(label="*Street Number", validators=[DataRequired(message="Street's number is a required field.")])

    city = StringField(label="*City", validators=[DataRequired(message="City is a required field.")])

    phone = IntegerField(label="*Phone", validators=[DataRequired(message="Phone is a required field.")])

    email = EmailField(label="*Email", validators=[DataRequired(message="Email is a required field.")])

    principal_first_name = StringField(label="*Principal", validators=[DataRequired(message="Principal's first name is a required field.")])

    principal_mid_name = StringField(label="")

    principal_last_name = StringField(label="", validators=[DataRequired(message="Principal's last name is a required field.")])

    submit = SubmitField("Annex")





