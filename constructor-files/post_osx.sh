#!/bin/bash

# pyshp PATCH
# pkg_resources has difficulties in finding pyshp and alabaster. Therefore we
# reinstall them to be save
if [[ ${DEBUG_PSYPLOT_INSTALLATION} != "" ]]; then
    $PREFIX/bin/python -c "import alabaster" || $PREFIX/bin/conda install $PREFIX/pkgs/alabaster-*.tar.bz2
    $PREFIX/bin/python -c "import idna" || $PREFIX/bin/conda install $PREFIX/pkgs/idna-*.tar.bz2
    $PREFIX/bin/python -c "import shapefile" || $PREFIX/bin/conda install $PREFIX/pkgs/pyshp-*.tar.bz2
    $PREFIX/bin/python -c "import dask" || $PREFIX/bin/conda install $PREFIX/pkgs/dask-*.tar.bz2
else
    $PREFIX/bin/python -c "import alabaster" &> /dev/null || $PREFIX/bin/conda install $PREFIX/pkgs/alabaster-*.tar.bz2 &> /dev/null
    $PREFIX/bin/python -c "import idna" &> /dev/null || $PREFIX/bin/conda install $PREFIX/pkgs/idna-*.tar.bz2 &> /dev/null
    $PREFIX/bin/python -c "import shapefile" &> /dev/null || $PREFIX/bin/conda install $PREFIX/pkgs/pyshp-*.tar.bz2 &> /dev/null
    $PREFIX/bin/python -c "import dask" &> /dev/null || $PREFIX/bin/conda install $PREFIX/pkgs/dask-*.tar.bz2 &> /dev/null
fi
$PREFIX/bin/python -c "import alabaster, idna, shapefile, dask"
# END pyshp PATCH

# script that is called after the installation of psyplot_conda to ask whether
# an alias for psyplot shall be created and an app shall be linked

if [[ $NO_PSYPLOT_ALIAS == "" ]] # interactive mode
then
    BASH_RC=$HOME/.bash_profile
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

alias psyplot='open -n -a \"$PREFIX\"/Psyplot.app --args \"-pwd \`pwd\`\"'
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
        cat >> $BASH_RC << EOF
# added by psyplot_conda installer
alias psyplot='open -n -a "$PREFIX"/Psyplot.app --args "-pwd \`pwd\`"'
EOF
    fi
fi

if [[ $NO_PSYPLOT_APP == "" ]] # interactive mode
then
    DEFAULT=$HOME/Applications/Psyplot.app
    echo -e "\x1b[31mShall I create an app?\x1b[0m"
    echo '(This question might be disabled by setting the NO_PSYPLOT_APP
environent variable to any value, e.g. `export NO_PSYPLOT_APP=1`)'
    echo -n "Shall I create an app? Please choose one of
1: $HOME/Applications/Psyplot.app folder, 2: /Applications/Psyplot.app, 3: No app,
any path: the exact location
[$DEFAULT] >>> "
    read ans
    case $ans in
        "")
            ans=$DEFAULT;;
        "1")
            ans=$DEFAULT;;
        "2")
            ans=/Applications/Psyplot.app;;
        "3")
            ans=""
    esac
    if [[ $ans != "" ]]; then
        mkdir `dirname $ans` &> /dev/null
        ln -sf $PREFIX/Psyplot.app $ans
    fi
fi

exit 0
