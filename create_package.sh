#!/bin/bash
set -xe

cp -r osx-app work

cd work

# insert versions
sed -i '' "s/0.01/$PKG_VERSION/" distribution.xml
chmod +x scripts/postinstall

# No need to keep the packages
sed -i '' '/keep_pkgs/d' ../psyplot-conda/construct.yaml

# build the installer
constructor ../psyplot-conda

INSTALLER=`ls psyplot-conda-*MacOSX-*.sh`

# extract the app
tar xjvf `conda build ../recipes/psyplot-gui --output | tail -n 1` psyplotapp
mv psyplotapp Psyplot.app

# use correct file size
SIZE=$(echo `du -ks $HOME/psyplot-conda | cut -f1`+`du -ks Psyplot.app | cut -f1` | bc -l)
cp ../psyplot-conda/intro.rst .
cat >> intro.rst << EOF

The final installation will require approximately $SIZE KB of disk space.
EOF

# convert intro, lices and conclusions to html
mkdir resources || :
pandoc -s -f markdown ../LICENSE -o resources/license.html
pandoc -s intro.rst -o resources/welcome.html
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
             ../psyplot-conda-$PKG_VERSION-MacOSX-x86_64.pkg

rm Psyplot.pkg
