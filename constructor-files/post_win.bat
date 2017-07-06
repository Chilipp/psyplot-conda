:: Install mkl if numpy cannot be imported
call "%PREFIX%\python.exe" -c "import numpy" || (
    call "%PREFIX%\Scripts\conda.exe" install -c conda-forge -y mkl
    ) || (
    ECHO "Could not install mkl. Run 'conda install -c conda-forge mkl'"
    )
