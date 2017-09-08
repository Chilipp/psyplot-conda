#!/bin/bash

# pyshp PATCH
# pkg_resources has difficulties in finding pyshp. Therefore we reinstall it
# to be save
$PREFIX/bin/python -c "import shapefile" || $PREFIX/bin/conda install $PREFIX/pkgs/pyshp-*.tar.bz2 &> \dev\null
# END pyshp PATCH

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
