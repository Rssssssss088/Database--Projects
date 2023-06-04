from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, SelectField, IntegerField
from wtforms.validators import DataRequired, Email, NumberRange

## when passed as a parameter to a template, an object of this class will be rendered as a regular HTML form
## with the additional restrictions specified for each field
class StudentCreate(FlaskForm):

    class_num = StringField(label = "Class (Class Number)", validators = [DataRequired(message = "Class Number is a required field.")])

    class_grade = StringField(label = "Class (Class Grade)", validators = [DataRequired(message = "Class Grade is a required field.")])

    class_tier = SelectField(label = "Class (Class Tier)", validators = [DataRequired(message = "Class Tier is a required field.")], choices = ["primary school", "junior highschool", "highschool"])



