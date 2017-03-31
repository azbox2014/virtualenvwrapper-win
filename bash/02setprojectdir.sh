#!/usr/bin/env bash
# description:  set project directory
# author:       archie2016

_venv_usage_setprojectdir() {
    echo
    echo "Pass in a full or relative path to the project directory"
    echo "If the directory doesn\'t exist, it will be created"
    echo
}

setprojectdir() {
    [ -z "$WORKON_HOME" ] && {
        cd "$USERPROFILE"
        cd $OLDPWD
        WORKON_HOME="$OLDPWD/Envs"
    }

    [ -z "$VIRTUALENVWRAPPER_PROJECT_FILENAME" ] && {
        VIRTUALENVWRAPPER_PROJECT_FILENAME=.project
    }

    [ -z "$VIRTUAL_ENV" ] && {
        echo
        echo "A virtualenv must be activated"
        _venv_usage_setprojectdir
        return 0
    }

    local prodir=$1

    [ -d "$prodir" ] || {
        echo
        echo "Project dir is not exist"
        return 1
    }

    if [ "$prodir" = "." ]; then
        prodir=`pwd`
    else
        cd $prodir
        cd $OLDPWD
        prodir="$OLDPWD"
    fi

    echo
    echo "$prodir is now the project directory for"
    echo "virtualenv $VIRTUAL_ENV"
    add2virtualenv "$prodir"
    return 0
}
