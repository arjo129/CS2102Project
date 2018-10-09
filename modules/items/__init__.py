from flask import Blueprint, session, render_template, request, redirect, url_for, g
from config import conn_string
import psycopg2


class Item:

    def __init__(self, item_id="", name="", owner="", location="", latitude="", longitude="", description="", date_start="", date_end=""):
        self.item_id = item_id
        self.name = name
        self.owner = owner
        self.location = location
        self.latitude = latitude
        self.longitude = longitude
        self.description = description
        self.date_start = date_start
        self.date_end = date_end


def view_item():
    conn = psycopg2.connect(conn_string)
    curr = conn.cursor()
    curr.execute("SELECT * FROM items");
    return curr


def add_item(item):
    conn = psycopg2.connect(conn_string)
    curr = conn.cursor()
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
    curr.execute("SELECT bidder, bid_amount FROM bid_for WHERE item_id=%s ORDER BY bid_amount DESC ", (item,))
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
        return int(curr.fetchone[0])+1
    else:
        return 0


item_module = Blueprint('item_module', __name__, template_folder='templates')


@item_module.route("/view_item", methods=['GET', 'POST'])
def view_page():
    if request.method == 'GET':
        items = view_item()
        return render_template("view_item.jinja2", items=items)

    if request.method == 'POST':
        item = request.form.get("item_entry")
        if item == None:
            return redirect("/view_item")
        item_id, name, owner, description = item.split()
        print(name)
        return redirect(url_for('.bid_item', item_id=item_id, name=name, owner=owner, description=description))


@item_module.route("/bid_item", methods=['GET', 'POST'])
def bid_item():
    if g.user == None:
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
        return redirect("/view_item")


@item_module.route("/loan_item", methods=['GET','POST'])
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
        item = Item(item_id=item_id, name=name, owner=owner, location=location, latitude=latitude, longitude=longitude, description=description,
                    date_start=date_start, date_end=date_end)

        add_item(item)
        return redirect("/view_item")
    else:
        return render_template("loan_item.jinja2")


@item_module.route("/view_bids", methods=['GET'])
def view_bids():
    item = request.args.get('item')
    bids = get_bids(item)
    return render_template("view_bids.jinja2", bids=bids)

