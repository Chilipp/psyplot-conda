# script to install psyplot-conda under Windows


function DeployPsyplot ($architecture) {
    Write-Host "Deploying psyplot-conda for" $architecture "bit architecture "
    if ($architecture -match "32") {
        $platform_suffix = "x86"
    } else {
        $platform_suffix = "x86_64"
    }
    $basedir = $pwd.Path + "\"
    $filepath = "psyplot-conda-*-Windows-" + $platform_suffix + ".exe"
    $filepath = Resolve-Path $filepath
    $target = "https://drive.switch.ch/remote.php/webdav/psyplot-conda/" + $env:APPVEYOR_REPO_BRANCH + "/" + $filepath
    $user = "philipp.sommer@unil.ch:" + $env:SWITCH_DRIVE_PW
    Write-Host "Deploying" $filepath "to" $target
    curl -X PUT -u $user $target --data-binary $filepath
}


function main () {
    DeployPsyplot $env:PYTHON_ARCH
}

main
