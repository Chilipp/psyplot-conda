:: Install mkl if numpy cannot be imported
start "" "%PREFIX%\python.exe" -c "import numpy" || (
    start "" "%PREFIX%\Scripts\conda.exe" install -c conda-forge -y mkl
    ) || (
    ECHO "Could not install mkl. Run 'conda install -c conda-forge mkl'"
    )
pause
