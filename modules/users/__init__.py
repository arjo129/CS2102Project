from flask import Blueprint, session, render_template, request, redirect, g
from bcrypt import hashpw, checkpw, gensalt
from config import conn_string
import psycopg2
import json


class User:
    """
    This class is the User model, contains all the relevant  data for the user
    """

    def __init__(self, display_name="", email="", password="", role="user", password_hash=None):
        self.display_name = display_name
        if password_hash:
            self.password = password_hash
        else:
            self.password = hashpw(
                password.encode(), gensalt()).decode('utf-8')
        self.email = email
        self.role = role

    def check_password(self, password):
        return checkpw(password.encode(), self.password)

    def to_json(self):
        return json.dumps({"name": self.display_name, "email": self.email, "role": self.role})


class InvalidLoginCredentials(Exception):
    """
    Thrown when there are invalid logins
    """
    pass


class UserAlreadyExists(Exception):
    pass


class UserIsBanned(Exception):
    pass


def check_login(email, password):
    conn = psycopg2.connect(conn_string)
    curr = conn.cursor()
    curr.execute(
        "SELECT u.display_name, u.email, u.password, u.role FROM users u WHERE u.email=%s", (email,))
    for display_name, email, password_hash, role in curr:
        user = User(display_name=display_name, email=email,
                    password_hash=password_hash.encode(), role=role)
        if user.check_password(password):
            return user
        elif user.role == 'banned':
            raise UserIsBanned
        else:
            raise InvalidLoginCredentials
    raise InvalidLoginCredentials


def add_user(user):
    conn = psycopg2.connect(conn_string)
    curr = conn.cursor()
    curr.execute("INSERT INTO users(display_name,email,password,role) VALUES (%s,%s,%s,%s)",
                 (user.display_name, user.email, user.password, user.role))
    conn.commit()


def retrieve_user(email):
    conn = psycopg2.connect(conn_string)
    curr = conn.cursor()
    curr.execute(
        "SELECT u.display_name, u.email, u.password, u.role FROM users u WHERE u.email=%s", (email,))
    for display_name, email, password_hash, role in curr:
        return User(display_name=display_name, email=email, password_hash=password_hash.encode(), role=role)
    raise InvalidLoginCredentials


def get_current_user():
    """
    Retrieves the user who is currently logged in. Use this method if you want to find who is logged in
    :return: User who is logged in
    """
    if 'user' in session:
        return retrieve_user(json.loads(session['user'])['email'])


user_module = Blueprint('user_module', __name__, template_folder='templates')


@user_module.route("/login", methods=['GET', 'POST'])
def login_page():
    if 'user' in session:
        return redirect("/")
    if request.method == 'POST':
        try:
            user = check_login(request.form["email"], request.form["password"])
            session['user'] = user.to_json()
            return redirect("/")
        except InvalidLoginCredentials:
            return render_template("login.jinja2", error=True)
        except UserIsBanned:
            return render_template("login.jinja2", banned=True)
    return render_template("login.jinja2")


@user_module.route("/signup", methods=['GET', 'POST'])
def signup_page():
    if 'user' in session:
        return redirect("/")
    try:
        if request.method == 'POST':
            if request.form['password'] != request.form['password2']:
                return render_template("signup.jinja2")
            new_user = User(display_name=request.form['uname'], email=request.form['email'],
                            password=request.form['password'])
            add_user(new_user)
            return redirect("/")
    except psycopg2.IntegrityError:
        return render_template("signup.jinja2", error=True)

    return render_template("signup.jinja2")


OPTION_BAN_USER = "Ban this user"
OPTION_PROMOTE_TO_ADMIN = "Promote to admin"
OPTION_UNBAN_DEMOTE = "Unban/Demote to user"
ADMIN_CONTROLS = [OPTION_BAN_USER, OPTION_PROMOTE_TO_ADMIN, OPTION_UNBAN_DEMOTE]


@user_module.route("/user_profile", methods=['GET', 'POST'])
def user_profile():
    if request.method == 'POST':
        if g.user and g.user.role == 'admin':
            new_role = 'user'
            if request.form.get('admin-controls') == OPTION_PROMOTE_TO_ADMIN:
                new_role = 'admin'
            elif request.form.get('admin-controls') == OPTION_BAN_USER:
                new_role = 'banned'
            conn = psycopg2.connect(conn_string)
            curr = conn.cursor()
            curr.execute("UPDATE users u SET role = %s WHERE u.email = %s", (new_role, request.args.get('owner')))
            conn.commit()
    else:
        admin = False
        if g.user and g.user.role == 'admin':
            admin = True
        user = request.args.get('owner')
        conn = psycopg2.connect(conn_string)
        curr = conn.cursor()
        curr.execute("SELECT * from users u WHERE u.email = %s", (user,))
        email, display_name, password, role = curr.fetchone()
        role = role.capitalize()
        curr.execute("SELECT * from items i, users u WHERE u.email = %s AND u.email = i.owner", (user,))
        items = curr
        can_view_bid = False;
        logged_in_as = get_current_user()
        if logged_in_as:
            if logged_in_as.email == email:
                print("same email")
                can_view_bid = True
        return render_template("user_profile.jinja2", role=role, email=email, display_name=display_name, items=items, view_bid=can_view_bid, admin=admin, admin_controls = ADMIN_CONTROLS)


@user_module.route("/logout", methods=['GET'])
def log_out():
    if get_current_user():
        del session['user']
    return redirect("/")

@user_module.route("/reset_password", methods=['GET'])
def reset_password():
    return render_template("reset.jinja2")