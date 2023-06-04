from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, SelectField, IntegerField, DateField, PasswordField, EmailField
from wtforms.validators import DataRequired, Email, NumberRange, Optional

## when passed as a parameter to a template, an object of this class will be rendered as a regular HTML form
## with the additional restrictions specified for each field


class CategorySearch(FlaskForm):

    category = StringField(label="Search Category" , validators=[Optional()])

    search = SubmitField(label="Search...")