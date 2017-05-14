# script to install psyplot-conda under Windows


function InstallPsyplot ($architecture, $python_home) {
    Write-Host "Installing psyplot-conda for" $architecture "bit architecture to" $python_home
    if (Test-Path $python_home) {
        Write-Host $python_home "already exists, skipping."
        return $false
    }
    if ($architecture -match "32") {
        $platform_suffix = "x86"
    } else {
        $platform_suffix = "x86_64"
    }
    $basedir = $pwd.Path + "\"
    $filename = "psyplot-conda-*-Windows-" + $platform_suffix + ".exe"
    $filepath = $basedir + $filename
    $filepath = Resolve-Path $filepath
    Write-Host "Installing" $filepath "to" $python_home
    $install_log = $python_home + ".log"
    $args = "/S /D=$python_home"
    Write-Host $filepath $args
    Start-Process -FilePath $filepath -ArgumentList $args -Wait -Passthru
    if (Test-Path $python_home) {
        Write-Host "Psyplot ($architecture) installation complete"
    } else {
        Write-Host "Failed to install Python in $python_home"
        Get-Content -Path $install_log
        Exit 1
    }
}


function main () {
    InstallPsyplot $env:PYTHON_ARCH $env:PSYPLOT_PYTHON
}

main
