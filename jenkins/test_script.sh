#!/bin/bash

set -e

#@--- Function to run the tests ---@#
run_api_tests() {
    #@--- Setup system locales ---@#
    export LC_ALL=C.UTF-8
    export LANG=C.UTF-8

    #@--- Activate the virtual environment ---@#
    # source $(python3 -m pipenv --venv)/bin/activate
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
