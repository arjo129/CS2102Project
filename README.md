# CS2102

This is supposed to be our cs2102 project. It has been tested on python 3.6. To run it you will need psycopg2, Jinja2 and flask.

````
pip3 install flask Jinja2 psycopg2 bcrypt
````
To connect to a database, one has to add a `config.py` in the same directory as `app.py`. Inside will be like so:
````
conn_string = "host='localhost' dbname='cs2102project' user='postgres' password='password'"
````
To run on Unix Bash (Linux, Mac, etc.):
```
$ FLASK_APP=app.py flask run
```
Otherwise using windows CMD:

```
> set FLASK_APP=app.py
> flask run
```
or Windows PowerShell:

```
> $env:FLASK_APP = "app.py"
> flask run

```
