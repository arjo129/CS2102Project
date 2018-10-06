from config import conn_string
from flask import Flask, render_template, request, redirect, send_from_directory, session
from modules.users import user_module
import os
import psycopg2

app = Flask(__name__)
app.secret_key = os.urandom(12)
#add your modules as blueprints here:
app.register_blueprint(user_module)

@app.route("/")
def index():
    return render_template("index.jinja2")


@app.route('/static/<path:path>')
def send_js(path):
    return send_from_directory('static', path)
