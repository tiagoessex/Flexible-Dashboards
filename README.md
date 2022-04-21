# dashboards

## Requirements

* Python >= 3.7.x

## .env

Use the **/flexdash/_env** example to create a **.env** file with the correct settings.


## Databases

Create the database *flexdash* and set the username, password and port in the *.env* file.

You can also use the file [flexdash.sql](https://github.com/tiago1856/dashboards/blob/master/flexdash.sql) to create and populate the tables (no need to makemigrations and migrate) or just the tables you need.

The file [world.sql](https://github.com/tiago1856/dashboards/blob/master/world.sql) contains the world database required for some queries and components already present in *flexdash.sql*.


## Installation

Use the package manager [pip](https://pip.pypa.io/en/stable/) to install the necessary packages.

In the root directory:

```bash
virtualenv env
```

Followed by:

```bash
run.bat
```

Install all dependencies:

```bash
pip install -r requirements.txt
```

Create a superuser:
```bash
python manage.py createsuperuser
```

Make and apply migrations:
```bash
python manage.py makemigrations
python manage.py migrate
```

Since this is an incomplete Django project, i.e., no login page and such, if you need to authenticate,
do it as Admin. So login in [http://127.0.0.1:8000/admin/](http://127.0.0.1:8000/admin/) before going to any place
that requires authentication.


## Execution

```bash
python manage.py runserver
```

There is only 1 application: *dashboards*.

Go to page [http://127.0.0.1:8000/dashboards/](http://127.0.0.1:8000/dashboards/)


## TODO

* connections: calendar component
* components: n-graph, geos, templates, ...

## Bugs to solve

| Bug        | Priority        | Solution | Status |
| ------------- |:-------------:|:-------------:|:-------------:|
| loading multiple identical components => appear as single comp in comms | `HIGH` | loading => new uuid | |
| graph rec => editcomponentmodal::display properties => 2x same fields to select in list | `HIGH` | loading => new uuid | |


