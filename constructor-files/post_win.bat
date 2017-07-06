:: Install mkl if numpy cannot be imported
ECHO "%PREFIX%\Scripts\conda.exe" install -c conda-forge -y mkl -n root
call "%PREFIX%\Scripts\conda.exe" install -c conda-forge -y mkl -n root
call "%PREFIX%\python.exe" -c "import numpy" || (
    call "%PREFIX%\Scripts\conda.exe" install -c conda-forge -y mkl -n root
    ) || (
    ECHO "Could not install mkl. Run 'conda install -c conda-forge mkl'"
    )
