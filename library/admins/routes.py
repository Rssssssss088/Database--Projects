from flask import Flask, render_template, request, flash, redirect, url_for, abort
from flask_mysqldb import MySQL
from library import db  # initially created by __init__.py, need to be used here
from library.admins.forms import Search311, Search312
from library.admins import admins

@admins.route("/admin/statistics/<username>", methods=["GET", "POST"])
def ShowStatistics(username):
    return render_template('admin_statistics.html', username=username)

@admins.route('/admin/statistics/311/<username>', methods=['GET', 'POST'])
def q311(username):

    query = "Select su.school_id, su.school_name, count(r.rental_id) as total_rentals from rentals r right join school_units su on su.school_id=r.school_id group by su.school_id order by total_rentals desc;"
    query1 = "Select su.school_id, su.school_name, count(r.rental_id) as total_rentals from rentals r right join school_units su on su.school_id=r.school_id where month(r.rental_id)=month(%s) and year(r.rental_id)=year(%s) group by su.school_id order by total_rentals desc;"

    form = Search311()

    try:
        if (request.method == "POST" and form.validate_on_submit()):
            form = Search311()
            newTerm = form.__dict__
            # Establish a connection to the database
            connection = db.connection
            cur = connection.cursor()

            # Execute a sample query
            cur.execute(query1, (newTerm['date'].data, newTerm['date'].data))
            column_names = [i[0] for i in cur.description]
            results = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
            cur.close()
            # Pass the results to the template
            return render_template("admin_311.html", results=results, form=form, username=username)
        else:
            form = Search311()
            # Establish a connection to the database
            connection = db.connection
            cur = connection.cursor()

            # Execute a sample query
            cur.execute(query)
            column_names = [i[0] for i in cur.description]
            results = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
            cur.close()

            # Pass the results to the template
            return render_template("admin_311.html", results=results, form=form, username=username)

    except Exception as e:
        return 'Failed to connect to the database: {}'.format(str(e))

    return 'Failed to connect to the database.'


@admins.route('/admin/statistics/312/<username>', methods=["GET", "POST"])
def q312(username):

    query1 = "Select * from 312a where category=%s order by author_first_name asc;"
    query2 = "Select * from 312b where category=%s order by username asc;"

    form = Search312()
    cur = db.connection.cursor()
    cur.execute('SELECT category, category FROM books_category group by category order by category asc;')
    form.categories.choices = list(cur.fetchall())
    initial = form.categories.choices[0][0]
    ## each tuple in the above list is in the format (id, full name),
    ## and will be rendered in html as an <option> of the <select>
    ## element, with value = id and content = full_name
    cur.close()

    try:
        if (request.method == "POST" and form.validate_on_submit()):
            newCategory = form.__dict__
            # Establish a connection to the database
            # Establish a connection to the database
            connection = db.connection
            cur = connection.cursor()

            # Execute a sample query
            cur.execute(query1, (newCategory['categories'].data,))
            acolumn_names = [i[0] for i in cur.description]
            aresults = [dict(zip(acolumn_names, entry)) for entry in cur.fetchall()]
            cur.execute(query2, (newCategory['categories'].data,))
            bcolumn_names = [i[0] for i in cur.description]
            bresults = [dict(zip(bcolumn_names, entry)) for entry in cur.fetchall()]
            cur.close()
            return render_template("admin_312.html", aresults=aresults, bresults=bresults, form=form, username=username)

        else:
            # Establish a connection to the database
            connection = db.connection
            cur = connection.cursor()

            # Execute a sample query
            cur.execute(query1, (initial,))
            acolumn_names = [i[0] for i in cur.description]
            aresults = [dict(zip(acolumn_names, entry)) for entry in cur.fetchall()]
            cur.execute(query2, (initial,))
            bcolumn_names = [i[0] for i in cur.description]
            bresults = [dict(zip(bcolumn_names, entry)) for entry in cur.fetchall()]
            cur.close()

            # Pass the results to the template
            return render_template("admin_312.html", aresults=aresults, bresults=bresults, form=form, username=username)

    except Exception as e:
        return 'Failed to connect to the database: {}'.format(str(e))

    return 'Failed to connect to the database.'


@admins.route('/admin/statistics/313/<username>', methods=['GET', 'POST'])
def q313(username):
    try:
        query = "Select * from young_users;"
        connection = db.connection
        cur = connection.cursor()
        # Execute a sample query
        cur.execute(query)
        column_names = [i[0] for i in cur.description]
        results = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        # Pass the results to the template
        return render_template("admin_313.html", results=results, username=username)

    except Exception as e:
        return 'Failed to connect to the database: {}'.format(str(e))

    return 'Failed to connect to the database.'


@admins.route('/admin/statistics/314/<username>', methods=['GET', 'POST'])
def q314(username):
    try:
        query = "Select * from lame_authors;"
        connection = db.connection
        cur = connection.cursor()
        # Execute a sample query
        cur.execute(query)
        column_names = [i[0] for i in cur.description]
        results = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        # Pass the results to the template
        return render_template("admin_314.html", results=results, username=username)

    except Exception as e:
        return 'Failed to connect to the database: {}'.format(str(e))

    return 'Failed to connect to the database.'

@admins.route('/admin/statistics/315/<username>', methods=['GET', 'POST'])
def q315(username):
    try:
        query = "Select * from coincidence;"
        connection = db.connection
        cur = connection.cursor()
        # Execute a sample query
        cur.execute(query)
        column_names = [i[0] for i in cur.description]
        results = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        # Pass the results to the template
        return render_template("admin_315.html", results=results, username=username)

    except Exception as e:
        return 'Failed to connect to the database: {}'.format(str(e))

    return 'Failed to connect to the database.'


@admins.route('/admin/statistics/316/<username>', methods=['GET', 'POST'])
def q316(username):
    try:
        query = "Select * from category_pairs;"
        connection = db.connection
        cur = connection.cursor()
        # Execute a sample query
        cur.execute(query)
        column_names = [i[0] for i in cur.description]
        results = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        # Pass the results to the template
        return render_template("admin_316.html", results=results, username=username)

    except Exception as e:
        return 'Failed to connect to the database: {}'.format(str(e))

    return 'Failed to connect to the database.'


@admins.route('/admin/statistics/317/<username>', methods=['GET', 'POST'])
def q317(username):
    try:
        query = "Select * from authors_less_than_5;"
        connection = db.connection
        cur = connection.cursor()
        # Execute a sample query
        cur.execute(query)
        column_names = [i[0] for i in cur.description]
        results = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        # Pass the results to the template
        return render_template("admin_317.html", results=results, username=username)

    except Exception as e:
        return 'Failed to connect to the database: {}'.format(str(e))

    return 'Failed to connect to the database.'

