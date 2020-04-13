#!/bin/bash

set -e

#@--- Function to run the tests ---@#
run_api_tests() {
    #@--- Setup system locales ---@#
    export LC_ALL=C.UTF-8
    export LANG=C.UTF-8

    #@--- Activate the virtual environment ---@#
    # source $(python3 -m pipenv --venv)/bin/activate
    # service postgresql start
    # su - postgres
    # su -c "psql -c \"CREATE ROLE my_user WITH LOGIN PASSWORD 'backend' \"" postgres
    su -c "psql -tc \"SELECT 1 FROM pg_user WHERE usename = 'my_user'\"" postgres | grep -q 1 || su -c "psql -c \"CREATE ROLE my_user LOGIN PASSWORD 'backend';\"" postgres
    # su -c "psql -c \"create database test;\"" postgres
    su -c "psql -tc \"SELECT 1 FROM pg_database WHERE datname = 'test'\"" postgres | grep -q 1 || su -c  "psql -c \"CREATE DATABASE test;\"" postgres
    # su -c "psql -c \"ALTER USER my_user WITH PASSWORD 'backend';\"" postgres
    su -c "psql -c \"ALTER USER my_user CREATEDB;\"" postgres
    su -c "psql -c \"GRANT ALL PRIVILEGES ON DATABASE test to my_user;\"" postgres

    pipenv run coverage run --source=app manage.py test --verbosity=2
    pipenv run coverage report -m
    #@--- Run the tests  ---@#
    # coverage -m run --source=app manage.py test --verbosity=2  && coverage report
}

main() {
    #@--- Run the function that will run tests on the code ---@#
    run_api_tests
}

#@--- Run the main function ---@#
main
