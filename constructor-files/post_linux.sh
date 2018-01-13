#!/bin/bash

if [[ ${DEBUG_PSYPLOT_INSTALLATION} != "" ]]; then
    set -x
fi

# noarch PATCH
# constructor cannot install noarch packages (i.e. packages independent of
# the architecture that have the `noarch` option), see
# https://github.com/conda/constructor/issues/86
# Therefore we install them manually using conda
$PREFIX/bin/conda install --force --no-deps --offline -y --use-local -p $PREFIX \
    dask-core pytz toolz cloudpickle pyshp jupyter_core
$PREFIX/bin/python -c "import shapefile, toolz, dask, cartopy, pytz, jupyter_core"
# END noarch PATCH

# script that is called after the installation of psyplot_conda to ask whether
# an alias for psyplot shall be created

if [[ $NO_PSYPLOT_ALIAS == "" ]] # interactive mode
then
    BASH_RC=$HOME/.bashrc
    DEFAULT=yes
    echo -e "\x1b[31mShall I add an alias to $BASH_RC\x1b[0m"
    echo '(This question might be disabled by setting the NO_PSYPLOT_ALIAS
environent variable to any value, e.g. `export NO_PSYPLOT_ALIAS=1`)'
    echo -n "Do you wish to create an alias for psyplot in your $BASH_RC ? [yes|no]
[$DEFAULT] >>> "
    read ans
    if [[ $ans == "" ]]; then
        ans=$DEFAULT
    fi
    if [[ ($ans != "yes") && ($ans != "Yes") && ($ans != "YES") &&
                ($ans != "y") && ($ans != "Y") ]]
    then
        echo "
You may wish to edit your $BASH_RC:

$ alias psyplot=$PREFIX/bin/psyplot
"
    else
        if [ -f $BASH_RC ]; then
            echo "
Creating alias for psyplot in $BASH_RC
A backup will be made to: ${BASH_RC}-psyplot_conda_alias.bak
"
            cp $BASH_RC ${BASH_RC}-psyplot_conda_alias.bak
        else
            echo "
Creating alias for psyplot in $BASH_RC in
newly created $BASH_RC"
        fi
        echo "
For this change to become active, you have to open a new terminal.
"
        echo "
# added by psyplot_conda installer
alias psyplot=\"$PREFIX/bin/psyplot\"" >> $BASH_RC
    fi
fi

source deactivate
