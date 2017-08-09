#!/bin/bash
# Deploy nightly builds to switchdrive
# Calling syntax:
#
#     bash deploy_nightly user:password filename

first=""
for arg in $@; do
    if [[ $first == "" ]]; then
        first=False
    else
        curl -X PUT -u $1 "https://drive.switch.ch/remote.php/webdav/psyplot-conda/$TRAVIS_BRANCH/$arg" --data-binary @$arg
    fi
done
