:: Install mkl if numpy cannot be imported
call "%PREFIX%\python.exe" -c "import numpy" && EXIT /B 0 || ECHO "Installing mkl to fix numpy"
call "%PREFIX%\Scripts\conda.exe" install -c conda-forge -y mkl -n root || ECHO "Could not install mkl. Run 'conda install -c conda-forge mkl'"

:: Install pyshp if it cannot be imported
call "%PREFIX%\python.exe" -c "import shapefile, alabaster" && EXIT /B 0 || ECHO "Installing pyshp to fix shapefile module"
call "%PREFIX%\Scripts\conda.exe" install -y "%PREFIX%\pkgs\pyshp-PYSHPVERSION.tar.bz2" "%PREFIX%\pkgs\alabaster-ALABASTERVERSION.tar.bz2" -n root || ECHO ""
