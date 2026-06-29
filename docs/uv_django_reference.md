# UV + Django Quick Reference
> Corey Schafer series companion — common commands at a glance

---

## 📦 Project Setup `uv`

| Command | Description |
|---|---|
| `uv init myproject` | create new project + pyproject.toml |
| `uv venv` | create .venv in current dir |
| `uv venv --python 3.12` | pin a specific python version |
| `source .venv/bin/activate` | activate (mac/linux) |
| `.venv\Scripts\activate` | activate (windows) |

---

## 📥 Packages `uv`

| Command | Description |
|---|---|
| `uv add django` | install + add to pyproject.toml |
| `uv add "django>=5.0"` | install with version constraint |
| `uv add --dev pytest` | add dev-only dependency |
| `uv remove django` | uninstall + remove from pyproject |
| `uv sync` | install all deps from lockfile |
| `uv pip list` | list installed packages |
| `uv lock` | regenerate uv.lock |

---

## 🚀 Running Things `uv`

| Command | Description |
|---|---|
| `uv run python script.py` | run in venv without activating |
| `uv run django-admin ...` | run any tool via uv |
| `uv run manage.py ...` | alternative to python manage.py |
| `uv tool install ruff` | install a global CLI tool |
| `uv tool run ruff check .` | run a tool without installing |

> 💡 `uv run` always uses the project venv automatically

---

## 🖥️ django-admin (new project) `django-admin`

| Command | Description |
|---|---|
| `django-admin startproject mysite .` | create project in current dir |
| `django-admin startproject mysite` | create project in new folder |
| `django-admin startapp blog` | create a new app |
| `django-admin version` | check django version |
| `django-admin help` | list all available commands |

> 💡 Use `django-admin` before manage.py exists; then switch to `manage.py`

---

## 🗄️ Database & Migrations `manage.py`

| Command | Description |
|---|---|
| `python manage.py makemigrations` | generate migration files from model changes |
| `python manage.py makemigrations blog` | generate for a specific app only |
| `python manage.py migrate` | apply pending migrations |
| `python manage.py migrate blog 0002` | migrate to a specific version |
| `python manage.py showmigrations` | list migrations and applied status |
| `python manage.py sqlmigrate blog 0001` | preview the SQL a migration will run |
| `python manage.py dbshell` | open interactive database shell |

---

## 🖥️ Dev Server & Shell `manage.py`

| Command | Description |
|---|---|
| `python manage.py runserver` | start dev server at localhost:8000 |
| `python manage.py runserver 0.0.0.0:8080` | bind to custom host/port |
| `python manage.py shell` | open interactive python shell (with django) |
| `python manage.py shell_plus` | auto-imports all models (django-extensions) |
| `python manage.py check` | validate project for common errors |
| `python manage.py check --deploy` | run deployment-specific checks |
| `python manage.py diffsettings` | show settings that differ from defaults |

---

## 👤 Users & Auth `manage.py`

| Command | Description |
|---|---|
| `python manage.py createsuperuser` | create an admin user interactively |
| `python manage.py changepassword alice` | change a user's password |
| `python manage.py createcachetable` | create DB cache table (if using DB cache) |

---

## 📁 Static Files & Data `manage.py`

| Command | Description |
|---|---|
| `python manage.py collectstatic` | gather static files into STATIC_ROOT |
| `python manage.py collectstatic --noinput` | skip confirmation prompt (CI/CD) |
| `python manage.py dumpdata blog` | export app data to JSON fixture |
| `python manage.py dumpdata blog > data.json` | save fixture to file |
| `python manage.py loaddata data.json` | import fixture into database |
| `python manage.py flush` | clear all data from database |

---

## 🔄 Typical Project Workflow `uv` `django-admin` `manage.py`

### 1 · Init
| Command | Description |
|---|---|
| `uv init mysite && cd mysite` | create project folder |
| `uv add django` | install django |
| `django-admin startproject mysite .` | scaffold django project |

### 2 · Develop
| Command | Description |
|---|---|
| `python manage.py startapp blog` | add an app |
| `python manage.py makemigrations && python manage.py migrate` | after any model change |
| `python manage.py createsuperuser` | set up admin access |
| `python manage.py runserver` | start dev server |

### 3 · Deploy
| Command | Description |
|---|---|
| `python manage.py check --deploy` | run deployment checks |
| `python manage.py collectstatic --noinput` | gather static files |
| `python manage.py migrate` | apply migrations on server |
