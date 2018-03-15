:: noarch PATCH
:: constructor cannot install noarch packages (i.e. packages independent of
:: the architecture that have the `noarch` option), see
:: https://github.com/conda/constructor/issues/86
:: Therefore we install them manually using conda
SET TOTEST=shapefile, toolz, dask, pytz, jupyter_core, cloudpickle, sphinx
SET TOINSTALL=dask-core pytz toolz cloudpickle pyshp jupyter_core, sphinx
call "%PREFIX%"/bin/python -c "import %TOTEST%"  && exit 0 || ECHO "Installing noarch packakges... might take a while"
call "%PREFIX%\Scripts\conda.exe" install --force --no-deps --offline -y --use-local -p %PREFIX%^
    %TOINSTALL%
call "%PREFIX%"/bin/python -c "import %TOTEST%"
