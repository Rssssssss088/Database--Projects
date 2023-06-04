from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, SelectField, IntegerField, DateField, PasswordField, EmailField
from wtforms.validators import DataRequired, Email, NumberRange

## when passed as a parameter to a template, an object of this class will be rendered as a regular HTML form
## with the additional restrictions specified for each field
class UserCreate(FlaskForm):

    username = StringField(label="*Username", validators=[DataRequired(message="Username is a required field.")])

    password = PasswordField(label="*Password", validators=[DataRequired(message="Password is a required field.")])

    first_name = StringField(label="*First name", validators=[DataRequired(message="First name is a required field.")])

    last_name = StringField(label="*Last name", validators=[DataRequired(message="Last name is a required field.")])

    email = EmailField(label = "*Email", validators = [DataRequired(message = "Email is a required field.")])

    phone = StringField(label = "*Phone", validators = [DataRequired(message = "Phone is a required field.")])

    school_name = SelectField(label = "*School Name")

    street_name = StringField(label = "*Address (Street Name)", validators = [DataRequired(message = "Street name is a required field.")])

    street_num = StringField(label = "*Address (Street Number)", validators = [DataRequired(message = "Street number is a required field.")])

    birthdate = DateField(label = "*Birthdate", validators = [DataRequired(message = "Birthdate is a required field.")])


    submit = SubmitField("Sign Up")

class UserLogin(FlaskForm):
    username = StringField(label="Username", validators=[DataRequired(message="Username is a required field.")])

    password = PasswordField(label="Password", validators=[DataRequired(message="Password is a required field.")])

    submit = SubmitField("Log In")


class Password(FlaskForm):

    password = PasswordField(label="New Password", validators=[DataRequired(message="This is a required field.")])

    submit = SubmitField("Update")

class UserSearch(FlaskForm):
    username = StringField(label="Search Username")

    search = SubmitField(label="Search...")



