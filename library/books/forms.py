from flask_wtf import FlaskForm
from wtforms import StringField, SubmitField, SelectField, IntegerField, SearchField, URLField, FieldList, FormField
from wtforms.validators import DataRequired, Email, NumberRange

class CategoriesForm(FlaskForm):

    categories = FieldList(StringField('Category Name'), min_entries=1, max_entries=5)

class AuthorForm(FlaskForm):
    author_first_name = StringField('Author')
    author_mid_name = StringField('')
    author_last_name = StringField('')



class KeywordForm(FlaskForm):
    keyword = StringField('Keyword')


class BookSearch(FlaskForm):
    term = SearchField(label="")

    search = SubmitField("Search...")


class BookCreate(FlaskForm):

    isbn = IntegerField(label="*ISBN")

    title = StringField(label="*Title")

    publisher = StringField(label="*Publisher")

    pages = IntegerField(label="Pages")

    summary = StringField(label="Summary")

    image = StringField(label="Image URL")

    language = StringField(label="Language")

    authors = FieldList(FormField(AuthorForm), min_entries=1, max_entries=5)

    keywords = FieldList(FormField(KeywordForm), min_entries=1, max_entries=5)

    submit = SubmitField("Insert")





