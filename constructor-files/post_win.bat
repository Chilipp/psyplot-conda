:: Install pyshp, alabaster and dask if they cannot be imported
call "%PREFIX%\python.exe" -c "import shapefile, alabaster, dask" && EXIT /B 0 || ECHO "Installing pyshp, alabaster and dask"
call "%PREFIX%\Scripts\conda.exe" install -y "%PREFIX%\pkgs\alabaster-ALABASTERVERSION.tar.bz2" -n root || ECHO ""
call "%PREFIX%\Scripts\conda.exe" install -y "%PREFIX%\pkgs\pyshp-PYSHPVERSION.tar.bz2" -n root || ECHO ""
call "%PREFIX%\Scripts\conda.exe" install -y "%PREFIX%\pkgs\dask-DASKVERSION.tar.bz2" -n root || ECHO ""
