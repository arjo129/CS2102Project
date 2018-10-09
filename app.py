from config import conn_string
from flask import Flask, render_template, request, redirect, send_from_directory, session, g
from modules.users import user_module, get_current_user
from modules.items import item_module
import os
import psycopg2

app = Flask(__name__)
app.secret_key = os.urandom(12)
# add your modules as blueprints here:
app.register_blueprint(user_module)
app.register_blueprint(item_module)


def getItems():
    conn = psycopg2.connect(conn_string)
    curr = conn.cursor()
    curr.execute(
        "SELECT * FROM items ")
    items = []
    for item in curr:
        items.append({"id": item[0], "name": item[1], "owner": item[2],
                      "location": item[3], "description": item[6]})
    return items


@app.before_request
def before_request():
    if 'user' in session:
        g.user = get_current_user()
    else:
        g.user = None


@app.route("/")
def index():

    return render_template("index.jinja2", items=getItems())


@app.route('/static/<path:path>')
def send_js(path):
    return send_from_directory('static', path)
