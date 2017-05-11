#!/bin/bash
# Deploy nightly builds to switchdrive
# Calling syntax:
#
#     bash deploy_nightly user:password filename

url -X PUT -u $1 "https://drive.switch.ch/remote.php/webdav/psyplot-conda/$TRAVIS_BRANCH/$2" --data-binary @"$2"
