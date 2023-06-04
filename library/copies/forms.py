from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, SelectField, IntegerField, SearchField, URLField, EmailField
from wtforms.validators import DataRequired, Email, NumberRange


class CreateCopy(FlaskForm):

    copy_id = IntegerField(label="*Copy ID", validators=[DataRequired(message="Copy ID is a required field.")])

    isbn = StringField(label="*ISBN", validators=[DataRequired(message="ISBN is a required field.")])

    submit = SubmitField("Insert")


class SelectCopy(FlaskForm):

    copy_id = SelectField(label="Select the copy")





