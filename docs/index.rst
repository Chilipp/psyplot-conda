.. psyplot-conda documentation master file, created by
   sphinx-quickstart on Wed Aug  9 17:18:17 2017.
   You can adapt this file completely to your liking, but it should at least
   contain the root `toctree` directive.

=========================================
Welcome to psyplot-conda's documentation!
=========================================

.. start-badges

.. only:: html and not epub

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

.. although this is a circular reference, we include the index here to make singlehtml working


.. toctree::
    :maxdepth: 1

    index

This document contains the necessary informations to install psyplot, the
most important plugins and the graphical user interface (GUI) via one single
executable.

Executables can be downloaded from the links above. Older versions are also
available through the the releases_ page, nightly builds for Linux and OSX are
available here_.

The installer provided here contain all necessary dependencies for psyplot_,
psyplot-gui_, psy-simple_, psy-maps_ and psy-reg_ plus the conda package for
managing virtual environments. These installers have been created using using
the conda constructor_ package and the packages from the conda-forge_ channel.


.. include:: <isonum.txt>

.. _install:

============
Installation
============

.. Contents::
    :local:

.. _install-linux:


Installation on Linux
=====================
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
====================
You can either install it from the terminal using a
:ref:`bash-script <install-osx-bash>` (``.sh`` file),
or you can install a self-contained app using an
:ref:`installer <install-osx-pkg>` (``.pkg`` file).

The bash script will install a conda installation in your desired location.
Both will create a ``Psyplot.app`` (see below).

.. _install-osx-pkg:

Installation using the OS X package installer
---------------------------------------------
This should be straight-forward, however Apple does not provide free Developer
IDs for open-source developers. Therefore our installers are not signed and
you have to give the permissions to open the files manually. The 4 steps below
describe the process.

1. Just download the ``.pkg`` file
2. To open it, you have to

   Right-click on the file |rarr| ``Open With`` |rarr| ``Installer``. In the appearing
   window, click the ``Open`` button.

3. Follow the instructions. It will create a ``Psyplot.app`` in the specified
   location.
4. To open the app the first time, change to the chosen installation directory
   for the App (by default ``$HOME/Applications``), right-click the
   ``Psyplot`` app and click on ``Open``. In the appearing window, again click
   on ``Open``.

.. _install-osx-bash:

Installation using the bash script
----------------------------------
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

Installation on Windows
=======================
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

.. _uninstall:

==============
Uninstallation
==============
The complete uninstallation requires three steps:

1. Delete the files (see the OS specific steps below)
2. Unregister the locations from your ``PATH`` variable (see below)
3. Delete the configuration directories. If you did not specify anything else
   (see :func:`psyplot.config.rcsetup.psyplot_fname`), the configuration files
   for psyplot are located in the user home directory. Under linux and OSX,
   this is ``$HOME/.config/psyplot``. On other platforms it is in the
   ``.psyplot`` directory in the user home.

.. Contents::
    :local:

.. _uninstall-linux:

Uninstallation on Linux
=======================
Just delete the folder where you installed ``psyplot-conda``. By default, this
is ``$HOME/psyplot-conda``, so just type::

    rm -rf $HOME/psyplot-conda

If you added a ``psyplot`` alias to your ``.bashrc`` (see
:ref:`installation instructions <install-linux>`) or chose to add the
``bin`` directory to your ``PATH`` variable during the installation, open your
``$HOME/.bashrc`` in an editor of your choice and delete those parts.


.. _uninstall-osx:

Uninstallation on OSX
=====================
The uninstallation depends on whether you have used the
:ref:`package installer <install-osx-pkg>` or the
:ref:`bash script <install-osx-bash>` for the installation.

.. _uninstall-osx-pkg:

Uninstall the App installed through the ``.pkg`` installer
----------------------------------------------------------
Just delete the app from your ``Applications`` folder. There have been no
changes made to your ``PATH`` variable.

.. _uninstall-osx-bash:

Uninstall the App install via bash script
-----------------------------------------
As for :ref:`linux <uninstall-linux>`, just delete the folder where you
installed ``psyplot-conda``. By default, this is ``$HOME/psyplot-conda``.
Open a terminal and just type::

    rm -rf $HOME/psyplot-conda

If you added a ``psyplot`` alias to your ``.bash_profile`` (see
:ref:`installation instructions <install-osx-bash>`) or chose to add the
``bin`` directory to your ``PATH`` variable during the installation, open your
``$HOME/.bash_profile`` in an editor of your choice and delete those parts.

If you chose to add a ``Psyplot`` app, just delete the symbolic link in
``/Applications`` or ``$HOME/Applications``.

.. _uninstall-win:

Uninstallation on Windows
=========================
Just double-click the ``Uninstall-Anaconda.exe`` file in the directory where
you installed ``psyplot-conda`` and follow the instructions.

This will also revert the changes in your ``PATH`` variable.


=========
Changelog
=========

.. include:: ../CHANGELOG.rst

==================
Indices and tables
==================

* :ref:`genindex`
* :ref:`modindex`
* :ref:`search`
