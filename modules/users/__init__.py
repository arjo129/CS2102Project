from flask import Blueprint, session, render_template
from bcrypt import hashpw, checkpw,gensalt
from config import conn_string
import psycopg2


class User:

    def __init__(self, display_name="", email="", password="", role="user", password_hash=None):
        self.display_name = display_name
        if password_hash:
            self.password = password_hash
        else:
            self.password = hashpw(password.encode(), gensalt()).decode('utf-8')
        self.email = email
        self.role = role

    def get_role(self):
        pass

    def check_password(self, password):
        return checkpw(password.encode(), self.password)


class InvalidLoginCredentials(Exception):
    pass


class UserAlreadyExists(Exception):
    pass


def check_login(email, password):
    conn = psycopg2.connect(conn_string)
    curr = conn.cursor()
    curr.execute("SELECT u.display_name, u.email, u.password, u.role FROM users u WHERE u.email=%s",(email,))
    for display_name, email, password_hash, role in curr:
        user = User(display_name=display_name, email=email, password_hash=password_hash.encode(), role=role)
        if user.check_password(password):
            return user
        else:
            raise InvalidLoginCredentials
    raise InvalidLoginCredentials


def add_user(user):
    conn = psycopg2.connect(conn_string)
    curr = conn.cursor()
    curr.execute("INSERT INTO users(display_name,email,password,role) VALUES (%s,%s,%s,%s)",
                 (user.display_name,user.email,user.password,user.role))
    conn.commit()


user_module = Blueprint('user_module', __name__,template_folder='templates')


@user_module.route("/login")
def login_page():
    return render_template("login.jinja2")
