from flask import Blueprint, session, render_template, request, redirect, url_for, g
from config import conn_string
from modules.categories import view_category, Category
from urllib import parse
import psycopg2


class Item:

    def __init__(self, item_id="", name="", owner="", location="", latitude="", longitude="", description="", date_start="", date_end="", categories=[]):
        self.item_id = item_id
        self.name = name
        self.owner = owner
        self.location = location
        self.latitude = latitude
        self.longitude = longitude
        self.description = description
        self.date_start = date_start
        self.date_end = date_end
        self.categories = categories


def view_item(item_id):
    conn = psycopg2.connect(conn_string)
    curr = conn.cursor()
    curr.execute("SELECT * FROM items where item_id=%s",  (item_id,))
    return curr.fetchone()


def add_item(item):
    conn = psycopg2.connect(conn_string)
    curr = conn.cursor()
    for category in item.categories:
        curr.execute("INSERT INTO item_belongs_to_category VALUES (%s, %s)", (item.item_id, category.name))
    curr.execute("INSERT INTO items VALUES (%s,%s,%s,%s,%s,%s,%s,%s,%s)",
                 (item.item_id, item.name, item.owner, item.location, item.latitude, item.longitude,
                  item.description, item.date_start, item.date_end))
    conn.commit()


def bid_for(bidder, item_id, bid_amount):
    conn = psycopg2.connect(conn_string)
    curr = conn.cursor()
    curr.execute("INSERT INTO bid_for VALUES (%s,%s,%s)",
                 (item_id, bidder, bid_amount))
    conn.commit()


def get_bids(item):
    conn = psycopg2.connect(conn_string)
    curr = conn.cursor()
    curr.execute(
        "SELECT bidder, bid_amount FROM bid_for WHERE item_id=%s ORDER BY bid_amount DESC ", (item,))
    bids = []
    for bidder, bid_amount in curr:
        bids.append({"user": bidder, "quantity": bid_amount})
    return bids

def get_id():
    conn = psycopg2.connect(conn_string)
    curr = conn.cursor()
    curr.execute("SELECT MAX(item_id) FROM items")
    conn.commit()
    index = curr.fetchone()[0]
    if index:
        return index + 1
    else:
        return 1


item_module = Blueprint('item_module', __name__, template_folder='templates')


@item_module.route("/view_item/<itemId>", methods=['GET', 'POST'])
def view_page(itemId):
    if request.method == 'GET':
        item = view_item(itemId)
        return render_template("view_item.jinja2", item=item)

    if request.method == 'POST':
        item = request.form.get("item_entry")
        if item == None:
            return redirect("/view_item/<itemId>")
        item_id, name, owner, description = item.split()
        return redirect(url_for('.bid_item', item_id=item_id, name=name, owner=owner, description=description))


@item_module.route("/bid_item", methods=['GET', 'POST'])
def bid_item():
    if g.user is None:
        return redirect("/login")

    name = request.args.get("name")
    owner = request.args.get("owner")
    description = request.args.get("description")
    item_id = request.args.get("item_id")
    if request.method == 'GET':
        return render_template("bid_item.jinja2", name=name, owner=owner, description=description, item_id=item_id)

    if request.method == 'POST':
        value = request.form.get("bid_value")
        bidder = g.user.email
        item_id = request.args.get("item_id")
        bid_for(item_id, bidder, value)
        return redirect("/view_item/{}".format(item_id))


@item_module.route("/loan_item", methods=['GET', 'POST'])
def loan_item():
    if g.user == None:
        return redirect("/login")

    elif request.method == 'POST':
        item_id = get_id()
        owner = g.user.email
        name = request.form.get("name")
        location = request.form.get("location")
        latitude = request.form.get("latitude")
        longitude = request.form.get("longitude")
        description = request.form.get("description")
        date_start = request.form.get("date_start")
        date_end = request.form.get("date_end")
        categories = []
        for category in map(lambda cat : cat[0], view_category()):
            if request.form.get(parse.quote(category)):
                categories.append(Category(category))
        item = Item(item_id=item_id, name=name, owner=owner, location=location, latitude=latitude, longitude=longitude, description=description,
                    date_start=date_start, date_end=date_end, categories=categories)

        add_item(item)
        return redirect("/view_item/{}".format(item_id))
    else:
        categories = map(lambda cat: (cat[0], parse.quote(cat[0])), view_category())
        return render_template("loan_item.jinja2", categories=categories)


@item_module.route("/view_bids", methods=['GET'])
def view_bids():
    item = request.args.get('item')
    bids = get_bids(item)
    return render_template("view_bids.jinja2", bids=bids)
