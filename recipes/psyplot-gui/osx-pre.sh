#!/bin/bash
# Script to uninstall the Psyplot.app on OSX
#
# This script runs after the deinstallation on of the conda package on OSX.
# It deletes the symbolic link named Psyplot.app in the /Applications folder or,
# if that doesn't exist, in the $HOME/Applications folder.

rm -rf /Applications/Psyplot.app
rm -rf "$HOME/Applications/Psyplot.app"
exit 0
