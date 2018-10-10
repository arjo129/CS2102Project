from flask import Blueprint, session, render_template, request, redirect, url_for, g
from config import conn_string
import psycopg2


class Category:

    def __init__(self, name=""):
        self.name = name


def view_category():
    conn = psycopg2.connect(conn_string)
    curr = conn.cursor()
    curr.execute("SELECT * FROM category")
    return curr


def add_category(category):
    conn = psycopg2.connect(conn_string)
    curr = conn.cursor()
    curr.execute("INSERT INTO category VALUES (%s)", (category.name,))
    conn.commit()


category_module = Blueprint('category_module', __name__, template_folder='templates')


@category_module.route("/view_category", methods=['GET', 'POST'])
def view_page():
    if request.method == 'POST':
        if g.user and g.user.role == 'admin':
            name = request.form.get("name")
            category = Category(name)
            add_category(category)
        return redirect(url_for('.view_page'))
    else:
        admin = False
        if g.user and g.user.role == 'admin':
            admin = True
        categories = view_category()
        return render_template("view_category.jinja2", categories=categories, admin=admin)


@category_module.route("/create_category", methods=['GET', 'POST'])
def create_category():
    if g.user is None:
        return redirect("/login")
    elif g.user.role != 'admin':
        return render_template("create_category.jinja2", admin=False)
    elif request.method == 'POST':
        name = request.form.get("name")
        category = Category(name)
        add_category(category)
        return redirect(url_for('.view_page'))
    else:
        return render_template("create_category.jinja2", admin=True)