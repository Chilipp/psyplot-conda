Conda installers for psyplot
============================

.. image:: http://unmaintained.tech/badge.svg
    :target: http://unmaintained.tech/
    :alt: No Maintenance Intended

This module is not maintained. Please rather download a miniconda_ installer
and install the packages via::

    conda install -c conda-forge psy-maps psyplot-gui psy-reg

or see the `psyplot installation instructions <http://psyplot.readthedocs.io/en/latest/installing.html>`__.

.. _miniconda: https://conda.io/miniconda.html

.. start-badges

.. list-table::
    :stub-columns: 1
    :widths: 10 90

    * - tests
      - |travis| |appveyor| |requires|
    * - nightly
      - |nightly|
    * - package
      - |github|

.. |travis| image:: https://travis-ci.org/Chilipp/psyplot-conda.svg?branch=master
    :alt: Travis
    :target: https://travis-ci.org/Chilipp/psyplot-conda

.. |appveyor| image:: https://ci.appveyor.com/api/projects/status/t0890y0q48pnxovu?svg=true
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

This repository contains the necessary files to create an executable that
can be used to install conda and psyplot (including GUI).

Executables can be downloaded from the Releases_ page, nightly builds for
Linux and OSX are available here_.

This installer contains all necessary dependencies for psyplot_, psyplot-gui_,
psy-simple_, psy-maps_ and psy-reg_ plus the conda package for managing
virtual environments. These installers have been created using using the
conda constructor_ package and the packages from the conda-forge_ channel.

Other ways to install psyplot can be found in the
`psyplot docs <http://psyplot.readthedocs.io/en/latest/installing.html>`__.


.. Contents::

Installation on Linux
---------------------
Download the bash script (file ending on ``'.sh'`` for linux) from
the Releases_ page and open a terminal window.

Type::

    bash '<path-to-the-downloaded-file.sh>'

and simply follow the instructions.

For more informations on the command line options type

Type::

    bash '<Path-to-the-downloaded-file.sh>' --help

It will ask you, whether you want to add a ``psyplot`` alias to your
``.bashrc``, such that you can easily start the terminal and type
``psyplot`` to start the GUI. You can avoid this by setting
``NO_PSYPLOT_ALIAS=1``. Hence, to install ``psyplot-conda`` without any
terminal interaction, run::

    NO_PSYPLOT_ALIAS=1 bash '<Path-to-the-downloaded-file.sh>' -b -p <target-path>


Installation on OS X
--------------------
You can either install it from the terminal using a bash-script (``.sh`` file),
or you can install a self-contained app using an installer (``.pkg`` file).

The bash script will install a conda installation in your desired location.
Both will create a ``Psyplot.app`` (see below).

Installation using the bash script
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Download the bash script (file ending on ``'.sh'`` for MacOSX) from
the Releases_ page and open a terminal window.

Type::

    bash '<path-to-the-downloaded-file.sh>'

and simply follow the instructions.

For more informations on the command line options type

Type::

    bash '<Path-to-the-downloaded-file.sh>' --help

By default, the installer asks whether you want to install a ``Psyplot.app``
into your ``Applications`` directory. You can avoid this be setting
``NO_PSYPLOT_APP=1``.

Furthermore it will ask you, whether you want to add a ``psyplot`` alias to
your ``.bash_profile``, such that you can easily start the terminal and type
``psyplot`` to start the GUI. You can avoid this by setting
``NO_PSYPLOT_ALIAS=1``. Hence, to install ``psyplot-conda`` without any
terminal interaction, run::

    NO_PSYPLOT_APP=1 NO_PSYPLOT_ALIAS=1 bash '<Path-to-the-downloaded-file.sh>' -b -p <target-path>

Installation using the OS X package installer
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Just download the ``.pkg`` file, double click it and follow the instructions.
It will create a ``Psyplot.app`` in the specified location.


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

Copyright
---------
Copyright (C) 2016-2018 Philipp S. Sommer

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.
