#!/bin/bash
set -xe

cp -r osx-app work

cd work

# insert versions
sed -i '' "s/0.01/$PKG_VERSION/" distribution.xml
chmod +x scripts/postinstall

INSTALLER=`ls ../psyplot-conda-*MacOSX-*.sh`

# extract the app
tar xjvf `conda build ../recipes/psyplot-gui --output | tail -n 1` psyplotapp
mv psyplotapp Psyplot.app

# use correct file size
SIZE=$(echo `du -ks $HOME/psyplot-conda | cut -f1`+`du -ks Psyplot.app | cut -f1` | bc -l)
sed -E -i '' "s/installKBytes=\"[0-9]+\"/installKBytes=\"$SIZE\"/g" distribution.xml

# convert intro, lices and conclusions to html
mkdir resources || :
pandoc -s -f markdown ../LICENSE -o resources/license.html
pandoc -s ../psyplot-conda/intro.rst -o resources/welcome.html
pandoc -s conclusion.rst -o resources/conclusion.html

cp $INSTALLER scripts/psyplot-conda-install.sh

# build the psyplot package
pkgbuild --component Psyplot.app \
         --scripts scripts \
         --version $PKG_VERSION \
         --ownership recommended \
         --install-location /Applications \
         Psyplot.pkg

# build the final package
productbuild --distribution distribution.xml \
             --resources resources \
             --package-path Psyplot.pkg \
             --version $PKG_VERSION \
             ../Psyplot.pkg

rm Psyplot.pkg
