from flask import Flask, render_template, request, flash, redirect, url_for, abort
from flask_mysqldb import MySQL
from library import db ## initially created by __init__.py, need to be used here
from library.lib_ops import lib_ops

@lib_ops.route("/lib_ops/<username>")
def ShowOperators(username):
    """
    Retrieve students from database
    """
    try:
        cur = db.connection.cursor()
        cur.execute("SELECT * FROM lib_op_approvals_rentals")
        column_names = [i[0] for i in cur.description]
        lib_ops = [dict(zip(column_names, entry)) for entry in cur.fetchall()]
        cur.close()
        return render_template("admin_lib_ops.html", admin = username, lib_ops=lib_ops, pageTitle = "Operator Approval Page")
    except Exception as e:
        ## if the connection to the database fails, return HTTP response 500
        flash(str(e), "danger")
        abort(500)


@lib_ops.route("/lib_op/approve/<admin>/<username>", methods = ["POST"])
def ApproveOperator(admin, username):
    query = "UPDATE lib_ops SET approved_by_admin = '{}' WHERE username='{}';".format(admin, username)
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        flash("Operator approved successfully", "success")
    except Exception as e:
        flash(str(e), "danger")
    return redirect(url_for("lib_ops.ShowOperators", username=admin))


@lib_ops.route("/lib_op/disapprove/<admin>/<username>", methods=["POST"])
def DisapproveOperator(admin, username):
    query = "UPDATE lib_ops SET approved_by_admin = NULL WHERE username='{}';".format(username)
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        flash("Operator disapproved successfully", "success")
    except Exception as e:
        flash(str(e), "danger")
    return redirect(url_for("lib_ops.ShowOperators", username=admin))


@lib_ops.route("/lib_op/delete/<admin>/<username>", methods = ["POST"])
def deleteOperator(admin, username):
    """
    Delete students by id from database
    """
    query = f"DELETE FROM lib_ops WHERE username = '{username}';"
    try:
        cur = db.connection.cursor()
        cur.execute(query)
        db.connection.commit()
        cur.close()
        flash("Operator deleted successfully", "primary")
    except Exception as e:
        flash(str(e), "danger")
    return redirect(url_for("lib_ops.ShowOperators", username=admin))


