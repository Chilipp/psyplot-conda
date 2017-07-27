Conda installers for psyplot
============================

.. start-badges

.. list-table::
    :stub-columns: 1
    :widths: 10 90

    * - tests
      - |travis| |appveyor| |requires|
    * - nightly
      - |nightly|

.. |travis| image:: https://travis-ci.org/Chilipp/psyplot-conda.svg?branch=master
    :alt: Travis
    :target: https://travis-ci.org/Chilipp/psyplot-conda

.. |appveyor| image:: https://ci.appveyor.com/api/projects/status/3jk6ea1n4a4dl6vk/branch/master?svg=true
    :alt: AppVeyor
    :target: https://ci.appveyor.com/project/Chilipp/psyplot-conda/branch/master

.. |requires| image:: https://requires.io/github/Chilipp/psyplot-conda/requirements.svg?branch=master
    :alt: Requirements Status
    :target: https://requires.io/github/Chilipp/psyplot-conda/requirements/?branch=master

.. |nightly| image:: https://travis-ci.org/Chilipp/psyplot-conda.svg?branch=nightly
    :alt: nightly on Travis
    :target: https://travis-ci.org/Chilipp/psyplot-conda

.. |github| image:: https://img.shields.io/github/release/Chilipp/psyplot-conda.svg
    :alt: Github releases
    :target: https://github.com/Chilipp/psyplot-conda/releases

.. start-badges

This repository is contains the necessary files to create an executable that
can be used to install conda and psyplot (including GUI).

Executables can be downloaded from the Releases_ page, nightly builds for
Linux and OSX are available here_.

This installer contains all necessary dependencies for psyplot_, psyplot-gui_,
psy-simple_, psy-maps_ and psy-reg_ plus the conda package for managing
virtual environments. These installers have been created using using the
conda constructor_ package and the packages from the conda-forge_ channel.



Installation on MacOSX and Linux
--------------------------------
Download the bash script (file ending on ``'.sh'`` for linux or MacOSX) from
the Releases_ page and open a terminal window.

Type::

    bash '<path-to-the-downloaded-file.sh>'

and simply follow the instructions.

For more informations on the command line options type

Type::

    bash '<Path-to-the-downloaded-file.sh>' --help

On MaxOSX, the installation will create an the ``psyplot.app`` in the
``/Applications`` folder which you can use to open the psyplot GUI. Otherwise
type ``psyplot`` in the terminal to open the GUI.


Installation on Windows
-----------------------
Just double click the downloaded file and follow the instructions. The
installation will create an item in the windows menu
(Start -> Programs -> Psyplot) which you can use to open the GUI. Otherwise,
open a command window (``cmd``) and type ``psyplot``.


.. _Releases: https://github.com/Chilipp/psyplot-conda/Releases
.. _here: https://drive.switch.ch/index.php/s/lVwRVtFncOljb6y
.. _psyplot: https://psyplot.readthedocs.io
.. _psyplot-gui: https://psyplot.readthedocs.io/projects/psyplot-gui
.. _psy-simple: https://psyplot.readthedocs.io/projects/psy-simple
.. _psy-maps: https://psyplot.readthedocs.io/projects/psy-simple
.. _psy-reg: https://psyplot.readthedocs.io/projects/psy-reg
.. _constructor: https://github.com/conda/constructor
.. _conda-forge: http://conda-forge.github.io/
