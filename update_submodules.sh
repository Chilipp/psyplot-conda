# Update submodules to the latest version from github

git submodule foreach 'git pull origin `git rev-parse --abbrev-ref HEAD`'

