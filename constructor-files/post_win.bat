:: Install mkl if numpy cannot be imported
call "%PREFIX%\python.exe" -c "import numpy" && EXIT /B 0 || ECHO "Installing mkl to fix numpy"
call "%PREFIX%\Scripts\conda.exe" install -c conda-forge -y mkl -n root || ECHO "Could not install mkl. Run 'conda install -c conda-forge mkl'"
