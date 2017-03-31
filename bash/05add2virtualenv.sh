#!/usr/bin/env bash
# description:  set project directory
# author:       archie2016

_venv_usage_add2virtualenv() {
    echo
    echo "Pass in a full or relative path of a directory to be added"
    echo "to the current virtualenv or non-virtualenv pythonpath."
    echo "If the directory doesn't exist, it will be created."
}

add2virtualenv() {
    # add2
    if [ -z "$PYTHONHOME" ]; then
        PYHOME=$PYTHONHOME
    elif [ -z "$VIRTUAL_ENV" ]; then
        PYHOME=$VIRTUAL_ENV
    else
        cd "$(python -c 'import sys;print(sys.exec_prefix)')"
        cd $OLDPWD
        PYHOME=$OLDPWD
    fi

    # main
    local prodir="$1"
    echo "$prodir" > $VIRTUAL_ENV$VIRTUALENVWRAPPER_PROJECT_FILENAME
    echo
    echo "$prodir added to"
    echo "$VIRTUAL_ENV$VIRTUALENVWRAPPER_PROJECT_FILENAME"
}

