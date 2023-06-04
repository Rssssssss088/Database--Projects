from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, SelectField, IntegerField, SearchField, URLField, EmailField, DecimalRangeField, TextAreaField
from wtforms.validators import DataRequired, Email, NumberRange


class CreateReview(FlaskForm):
    rating = IntegerField(label="Rating", validators=[DataRequired(message="Rating is a required field."),
                                                           NumberRange(min=0, max=5)])

    comment = TextAreaField(label="Comment")

    submit = SubmitField("Rate")






