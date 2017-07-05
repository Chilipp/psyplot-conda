:: Install mkl if numpy cannot be imported
%PREFIX%\python.exe -c "import numpy" || (
    %PREFIX%\Scripts\conda.exe -c conda-forge -y mkl
    ) || (
    ECHO "Could not install mkl. Run 'conda install -c conda-forge mkl'"
    )
