:: noarch PATCH
:: constructor cannot install noarch packages (i.e. packages independent of
:: the architecture that have the `noarch` option), see
:: https://github.com/conda/constructor/issues/86
:: Therefore we install them manually using conda
call "%PREFIX%\Scripts\conda.exe" install --force --no-deps --offline -y --use-local -p %PREFIX%^
    dask-core pytz toolz cloudpickle pyshp jupyter_core
call "%PREFIX%"/bin/python -c "import shapefile, toolz, dask, pytz, jupyter_core, cloudpickle"
