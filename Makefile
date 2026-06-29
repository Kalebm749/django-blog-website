.PHONY: install sync dev check test migrate makemigrations shell superuser lint clean

PYTHON = uv run

install:
	uv sync

sync:
	uv sync

dev:
	$(PYTHON) manage.py runserver

check:
	$(PYTHON) manage.py check

test:
	$(PYTHON) manage.py test

migrate:
	$(PYTHON) manage.py migrate

makemigrations:
	$(PYTHON) manage.py makemigrations

shell:
	$(PYTHON) manage.py shell

superuser:
	$(PYTHON) manage.py createsuperuser

lint:
	$(PYTHON) ruff check .
	$(PYTHON) ruff format --check .

format:
	$(PYTHON) ruff format .

clean:
	find . -type d -name "__pycache__" -exec rm -rf {} +
	find . -type f -name "*.pyc" -delete