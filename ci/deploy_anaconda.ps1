# script to upload files to anaconda


function UploadToAnaconda ($python_home) {
    Write-Host "Uploading files for from" $python_home

    $basedir = $pwd.Path + "\"

    $filepath = $basedir + "builds\psy*.tar.bz2"
    $filepath = Resolve-Path $filepath

    Write-Host "Uploading" $filepath
    $anaconda_path = $python_home + "\Scripts\anaconda.exe"
    $args = "-t " + $env:CONDA_REPO_TOKEN +" upload --force -l dev " + $filepath
    Write-Host $anaconda_path $args
    $proc = (Start-Process -FilePath $anaconda_path -ArgumentList $args -Wait -Passthru)
    if ($proc.ExitCode -ne 0) {
        Write-Host "Failed."
        Exit 1
    } else {
        Write-Host "Upload complete"
    }
}


function main () {
    UploadToAnaconda $env:PSYPLOT_PYTHON
}

main
