#!/usr/bin/env bash
# description:  got top virtualenv directory
# author:       archie2016

cdvirtualenv() {
    [ -n "$PYTHONHOME" ] && {
        cd $PYTHONHOME
        return 0
    }

    [ -n "$VIRTUAL_ENV" ] && {
        cd $VIRTUAL_ENV
        return 0
    }

    cd "$(python -c 'import sys;print(sys.exec_prefix)')"
}
