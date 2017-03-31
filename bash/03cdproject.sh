#!/usr/bin/env bash
# description:  goto refered project directory
# author:       archie2016

_venv_usage_cdproject() {
    echo
    echo "switches to the project dir of the activated virtualenv"
    echo
}

cdproject() {
    [ -z "$VIRTUAL_ENV" ] && {
        echo
        echo "a virtualenv must be activated"
        return 0
    }

    [ -z "$VIRTUALENVWRAPPER_PROJECT_FILENAME" ] && {
        VIRTUALENVWRAPPER_PROJECT_FILENAME=.project
    }

    [ -f "$VIRTUAL_ENV/$VIRTUALENVWRAPPER_PROJECT_FILENAME" ] || {
        echo
        echo "No project directory found for current virtualenv"
        return 1
    }

    _LAST_DIR=$(pwd)
    cd $(cat "$VIRTUAL_ENV/$VIRTUALENVWRAPPER_PROJECT_FILENAME")
    return 0
}
