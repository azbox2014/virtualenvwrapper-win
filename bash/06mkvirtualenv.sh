#!/usr/bin/env bash
# description:  create virtualenv
# author:       archie2016

# if WORKON_HOME is not exist
[ -z "$WORKON_HOME" ]  && {
    WORKON_HOME=$HOME/Envs
}

_venv_usage_mkvirtualenv() {
    echo
    echo "Pass a name to create a new virtualenv"
    echo
}

mkvirtualenv() {
    local CURRPWD=`pwd`
    # deactivate current virtualenv
    [ -n "$VIRTUAL_ENV" ] && deactivate

    # set PYHOME(local) base PYTHONHOME (if exist) or python location
    local PYHOME="$PYTHONHOME"
    [ -z "$PYHOME" ] && PYHOME=`python.exe -c "import sys;print(sys.exec_prefix)"`

    # make sure WORKON_HOME exist
    [ ! -d "$WORKON_HOME" ] && mkdir -p "$WORKON_HOME"

    # get user input virtualenv name
    local ENVNAME=""
    for ENVNAME in $@; do
        [ -n "$(echo $ENVNAME | egrep '^\w+$')" ] && break
    done

    # verify virtualenv name valid. (not a exist folder)
    [ -z "$ENVNAME" -o -d "$WORKON_HOME/$ENVNAME" ] && {
        echo
        echo "virtualenv name $ENVNAME is invalid"
        return 0
    }

    # create virtualenv, if create failed, goto end
    cd "$WORKON_HOME"
    if [ -e "$PYHOME/Scripts/virtualenv-script.py" ]; then
        # need to be modify to push all the arguments
        python "$PYHOME/Scripts/virtualenv-script.py" $@
    else
        virtualenv.exe $@
    fi
    cd "$CURRPWD"
}

