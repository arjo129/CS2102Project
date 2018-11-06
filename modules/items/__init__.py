from flask import Blueprint, session, render_template, request, redirect, url_for, g, flash
from psycopg2._psycopg import InternalError

from config import conn_string
from modules.categories import view_category, Category
from urllib import parse
from modules.users import get_current_user
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


def get_owner(item_id):
    conn = psycopg2.connect(conn_string)
    curr = conn.cursor()
    curr.execute("SELECT owner FROM items where item_id=%s", (item_id,))
    (owner,)= curr.fetchone()
    return owner


def view_item(item_id):
    conn = psycopg2.connect(conn_string)
    curr = conn.cursor()
    curr.execute("SELECT i.item_id, i.name, i.owner, i.description, u.display_name FROM items i, users u "
                 "WHERE i.item_id=%s AND i.owner = u.email",  (item_id,))
    return curr.fetchone()


def view_other_related_items(item_id):
    conn = psycopg2.connect(conn_string)
    curr = conn.cursor()
    curr.execute("SELECT DISTINCT i.item_id, i.name, u.display_name, i.location FROM bid_for b "
                 "INNER JOIN bid_for b2 ON b.bidder = b2.bidder AND b2.item_id <> b.item_id AND b.item_id = %s"
                 "INNER JOIN items i ON i.item_id = b2.item_id "
				 "INNER JOIN users u ON u.email = b2.bidder "
                 "ORDER BY i.item_id DESC",  (item_id,))
    return curr.fetchall()


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
    curr.execute("INSERT INTO bid_for VALUES (%s,%s,%s,'unknown')",
                 (item_id, bidder, bid_amount))
    conn.commit()


def update_bid(item_id, bidder, value):
    conn = psycopg2.connect(conn_string)
    curr = conn.cursor()
    curr.execute("UPDATE bid_for SET bid_amount = %s WHERE bidder = %s AND item_id = %s",
                 (value, bidder, item_id))
    conn.commit()


def accept_bid(item_id, bidder):
    conn = psycopg2.connect(conn_string)
    curr = conn.cursor()
    curr.execute("UPDATE bid_for SET selected ='selected' WHERE bidder = %s AND item_id = %s",
                 (bidder, item_id))
    curr.execute("UPDATE bid_for SET selected ='rejected' WHERE bidder != %s AND item_id = %s",
                 (bidder, item_id))
    conn.commit()


def get_bids(item):
    conn = psycopg2.connect(conn_string)
    curr = conn.cursor()
    curr.execute(
        "SELECT bidder, bid_amount FROM bid_for WHERE item_id=%s ORDER BY bid_amount DESC ", (item,))
    bids = []
    for bidder, bid_amount in curr:
        print(item)
        bids.append({"user": bidder, "quantity": bid_amount })
    return bids


def get_bids_by_user(user):
    conn = psycopg2.connect(conn_string)
    curr = conn.cursor()
    curr.execute(
        "SELECT i.name, i.item_id, b.bid_amount, b.selected FROM bid_for b, items i "
        "WHERE b.bidder = %s AND i.item_id = b.item_id", (user,))
    bids = []
    for item, item_id, bid_amount, status in curr:
        print(item_id)
        bids.append({"item_name": item, "item_id": item_id, "quantity": bid_amount, "selected": status })
    return bids


def get_highest_bids(item):
    conn = psycopg2.connect(conn_string)
    curr = conn.cursor()
    curr.execute(
        "SELECT u.display_name, b.bidder, b.bid_amount FROM bid_for b INNER JOIN users u "
        "ON b.bidder = u.email AND b.item_id=%s AND b.bid_amount >= "
        "ALL(SELECT bid_amount FROM bid_for WHERE item_id=%s)", (item, item))
    bid = curr.fetchall()
    return bid


def get_lowest_bids(item):
    conn = psycopg2.connect(conn_string)
    curr = conn.cursor()
    curr.execute(
        "SELECT u.display_name, b.bidder, b.bid_amount FROM bid_for b INNER JOIN users u "
        "ON b.bidder = u.email AND b.item_id=%s AND b.bid_amount <= "
        "ALL(SELECT bid_amount FROM bid_for WHERE item_id=%s)", (item, item))
    bid = curr.fetchall()
    return bid


def get_average_bid(item):
    conn = psycopg2.connect(conn_string)
    curr = conn.cursor()
    curr.execute(
        "SELECT AVG(bid_amount) FROM bid_for GROUP BY item_id HAVING item_id=%s", (item,))
    bid = curr.fetchone()
    if bid:
        bid = round(bid[0], 2)
    return bid
  

def check_if_user_has_bid(user, item):
    conn = psycopg2.connect(conn_string)
    curr = conn.cursor()
    curr.execute(
        "SELECT b.bid_amount FROM bid_for b WHERE b.bidder = %s AND b.item_id = %s",
        (user, item))
    for (b,) in curr:
        return b
    return False


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


@item_module.route("/view_item/<item_id>", methods=['GET', 'POST'])
def view_page(item_id):
    if request.method == 'GET':
        item = view_item(item_id)
        bid_placed = False
        if g.user and check_if_user_has_bid(get_current_user().email, item_id):
            bid_placed = True
        return render_template("view_item.jinja2", item=item, highest_bids=get_highest_bids(item_id),
                               lowest_bids=get_lowest_bids(item_id), average_bid=get_average_bid(item_id),
                               bid_placed=bid_placed, related_items=view_other_related_items(item_id),
                               can_bid=g.user and g.user.email != item[2])
    if request.method == 'POST':
        item = request.form.get("item_entry")
        if item == None:
            return redirect("/view_item/<item_id>")
        item_id, name, owner, description = item.split()
        return redirect(url_for('.bid_item', item_id=item_id, name=name, owner=owner, description=description))


def delete_bid(user, item_id):
    conn = psycopg2.connect(conn_string)
    curr = conn.cursor()
    curr.execute("DELETE FROM bid_for WHERE bidder = %s AND item_id = %s",
                 (user, item_id))
    conn.commit()


@item_module.route("/delete_bid", methods=['GET'])
def retract_bid():
    if g.user is None:
        return redirect("/login")
    item_id = request.args.get("item_id")
    delete_bid(g.user.email, item_id)
    return redirect("/my_bids")


@item_module.route("/bid_item", methods=['GET', 'POST'])
def bid_item():
    if g.user is None:
        return redirect("/login")
    name = request.args.get("name")
    owner = request.args.get("owner")
    description = request.args.get("description")
    item_id = request.args.get("item_id")
    if request.method == 'GET':
        price = check_if_user_has_bid(g.user.email, item_id)
        if not price:
            return render_template("bid_item.jinja2", name=name, owner=owner, description=description, item_id=item_id)
        else:
            return render_template("bid_item.jinja2", name=name, owner=owner, description=description, item_id=item_id, prev_price=price)
    if request.method == 'POST':
        value = request.form.get("bid_value")
        bidder = g.user.email
        item_id = request.args.get("item_id")
        if not check_if_user_has_bid(g.user.email, item_id):
            bid_for(item_id, bidder, value)
        else:
            update_bid(item_id, bidder, value)
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
        try:
            add_item(item)
        except InternalError as e:
            categories = map(lambda cat: (cat[0], parse.quote(cat[0])), view_category())
            return render_template("loan_item.jinja2", categories=categories, error=str(e))
        return redirect("/view_item/{}".format(item_id))
    else:
        categories = map(lambda cat: (cat[0], parse.quote(cat[0])), view_category())
        return render_template("loan_item.jinja2", categories=categories)


@item_module.route("/view_bids", methods=['GET'])
def view_bids():
    item = request.args.get('item')
    bids = get_bids(item)
    return render_template("view_bids.jinja2", bids=bids, item=item)


@item_module.route("/my_bids", methods=['GET'])
def my_bids():
    if g.user is None:
        return redirect("/login")
    user = get_current_user()
    return render_template("my_bids.jinja2", bids=get_bids_by_user(user.email))

@item_module.route("/accept_bid", methods=['GET'])
def accept():
    if g.user is None:
        return redirect("/login")
    item = request.args.get("item")
    bidder = request.args.get("bidder")
    if get_owner(item) != g.user.email:
        return "G3T 0UT H4x0r!!"
    accept_bid(item, bidder)
    return redirect("/")