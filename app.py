from config import conn_string
from flask import Flask, render_template, request, redirect, send_from_directory
import psycopg2

app = Flask(__name__)

@app.route("/save_update", methods=['GET','POST'])
def save_update():
    conn = psycopg2.connect(conn_string)
    curr = conn.cursor()
    curr.execute("UPDATE book SET book_id = %s,name = %s,price = %s, date_of_publication = %s",(request.form["bookid_updated"], request.form['book_name_updated'], float(request.form['price_updated']),request.form['dop_updated']))
    conn.commit()
    return redirect("/")
@app.route("/update", methods=['GET','POST'])
def update():
    conn = psycopg2.connect(conn_string)
    curr = conn.cursor()
    curr.execute("SELECT * FROM book WHERE book_id=%s",(request.form["bookid"],));
    for c in curr:
        book_id, name, price, dop = c
        print(name)
    return render_template("update.jinja2", book_id=book_id, name=name, price=price, dop=dop)

@app.route("/")
def index():
    return render_template("index.jinja2")

@app.route('/static/<path:path>')
def send_js(path):
    return send_from_directory('static', path)
