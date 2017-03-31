#!/usr/bin/env bash
# description:  config for the wrapper
# author:       archie2016

WORKON_HOME=/D/04.Projects/virtualenv

VIRTUALENVWRAPPER_PROJECT_FILENAME=/Lib/site-packages/virtualenv_path_extensions.pth
export WORKON_HOME=`dirname $WORKON_HOME/FILE`
export VIRTUALENVWRAPPER_PROJECT_FILENAME=$VIRTUALENVWRAPPER_PROJECT_FILENAME
