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


def view_subcategory(subcategory):
    conn = psycopg2.connect(conn_string)
    curr = conn.cursor()
    curr.execute("SELECT i.item_id, i.name, u.display_name, i.location "
                     "FROM items i, users u, item_belongs_to_category ic "
                     "WHERE i.owner = u.email "
                     "AND u.role != 'banned' "
                     "AND ic.item_id = i.item_id "
                     "AND ic.category = %s "
                     "AND i.item_id NOT IN (SELECT item_id FROM bid_for WHERE selected='selected')" 
                     "ORDER BY i.item_id DESC", (subcategory,))
    # list of item ids that belong to subcategory
    return curr.fetchall()


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

@category_module.route("/view_subcategory", methods=['GET', 'POST'])
def view_subcategory_page():
    subcategory = request.args.get("subcategory")
    items = view_subcategory(subcategory)
    return render_template("view_subcategory.jinja2", items=items, subcategory=subcategory)

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


        