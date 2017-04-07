# Update submodules to the latest version from github

for PKG in psyplot psyplot-gui psy-simple psy-maps psy-reg; do
    cd $PKG
    git pull origin `git rev-parse --abbrev-ref HEAD`
    cd ../
done
