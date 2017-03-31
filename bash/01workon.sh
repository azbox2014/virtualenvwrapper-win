#!/usr/bin/env bash
# description:  show env and switch env
# author:       archie2016

# if WORKON_HOME is not exist
[ -z "$WORKON_HOME" ]  && {
    WORKON_HOME=$HOME/Envs
}

workon() {
    [ $# -eq 0 ] && {
        echo
        echo Pass a name to activate one of the following virtualenvs:
        echo ==============================================================================
        ls -1 $WORKON_HOME
        return 0
    }

    local VENV=$1
    local CHANGEDIR=0
    shift
    while [ $# -ne 0 ]; do
        [ "$1" = "-c" ] && CHANGEDIR=1
        shift
    done

    # create WORKON_HOME folder
    [ -d "$WORKON_HOME" ] || {
        mkdir $WORKON_HOME
    }

    # VENV not exist
    [ -d "$WORKON_HOME/$VENV" ] || {
        echo
        echo "virtualenv $VENV does not exist"
        echo "Create it with \"mkvirtualenv $VENV\""
        return 0
    }

    # activate script is not exist
    [ -f "$WORKON_HOME/$VENV/Scripts/activate" ] || {
        echo
        echo "$WORKON_HOME/$VENV"
        echo "does\'t contain a virtualenv ^(yet^)"
        echo "Create it with \"mkvirtualenv $VENV\""
        return 0
    }

    # activate env
    source $WORKON_HOME/$VENV/Scripts/activate

    # goto project
    if [ -f "$WORKON_HOME/$VENV/$VIRTUALENVWRAPPER_PROJECT_FILENAME" ]; then
        # cdproject
        :
    elif [ $CHANGEDIR -eq 1 ]; then
        cd $WORKON_HOME/$VENV
    fi
}
