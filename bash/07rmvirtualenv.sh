#!/usr/bin/env bash
# description:  show env and switch env
# author:       archie2016

# if WORKON_HOME is not exist
[ -z "$WORKON_HOME" ]  && {
    WORKON_HOME=$HOME/Envs
}

_venv_usage_rmvirtualenv() {
    echo
    echo "Pass a name to remove a virtualenv"
    echo
}

rmvirtualenv() {
    local CURRPWD=`pwd`
    # if WORKON_HOME is not exist
    [ -z "$WORKON_HOME" ]  && {
        WORKON_HOME=$HOME/Envs
    }

    # deactivate specified virenv, since it is current active virtualenv
    [ -n "$VIRTUAL_ENV" -a "$VIRTUAL_ENV" = "$WORKON_HOME/$1" ]  && \
        deactivate

    # specified virtualenv exist
    [ ! -d "$WORKON_HOME/$1" ] && {
        echo
        echo "virtualenv $1 doesn\'t exist"
        return 0
    }

    # remove the virtualenv
    cdvirtualenv && cd ..
    rm -rf $1
    [ -e "$CURRPWD" ] && cd "$CURRPWD"
}
