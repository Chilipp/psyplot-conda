#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# psyplot-conda documentation build configuration file, created by
# sphinx-quickstart on Wed Aug  9 17:18:17 2017.
#
# This file is execfile()d with the current directory set to its
# containing dir.
#
import six
import sphinx_rtd_theme
import json
import logging

if six.PY2:
    from urllib import urlopen
else:
    from urllib.request import urlopen


# -- General configuration ------------------------------------------------

extensions = [
    'sphinx.ext.intersphinx',
    'sphinx.ext.extlinks',
    ]

# Add any paths that contain templates here, relative to this directory.
templates_path = ['_templates']

# The suffix(es) of source filenames.
# You can specify multiple suffix as a list of string:
#
# source_suffix = ['.rst', '.md']
source_suffix = '.rst'

# The master toctree document.
master_doc = 'index'

# General information about the project.
project = 'psyplot-conda'
copyright = '2017, Philipp S. Sommer'
author = 'Philipp S. Sommer'

# The version info for the project you're documenting, acts as replacement for
# |version| and |release|, also used in various other places throughout the
# built documents.
#
# The short X.Y version.
version = '1.0.0'
# The full version, including alpha/beta/rc tags.
release = '1.0.0'

# The language for content autogenerated by Sphinx. Refer to documentation
# for a list of supported languages.
#
# This is also used if you do content translation via gettext catalogs.
# Usually you set "language" from the command line for these cases.
language = None

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This patterns also effect to html_static_path and html_extra_path
exclude_patterns = []

# The name of the Pygments (syntax highlighting) style to use.
pygments_style = 'sphinx'

# If true, `todo` and `todoList` produce output, else they produce nothing.
todo_include_todos = False


# -- Options for HTML output ----------------------------------------------

# The theme to use for HTML and HTML Help pages.
html_theme = 'sphinx_rtd_theme'
html_theme_path = [sphinx_rtd_theme.get_html_theme_path()]

# Theme options are theme-specific and customize the look and feel of a theme
# further.  For a list of options available for each theme, see the
# documentation.
#
# html_theme_options = {}

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ['_static']

# Custom sidebar templates, must be a dictionary that maps document names
# to template names.


# -- Options for HTMLHelp output ------------------------------------------

# Output file base name for HTML help builder.
htmlhelp_basename = 'psyplot-condadoc'


# -- Options for LaTeX output ---------------------------------------------

latex_elements = {
    # The paper size ('letterpaper' or 'a4paper').
    #
    # 'papersize': 'letterpaper',

    # The font size ('10pt', '11pt' or '12pt').
    #
    # 'pointsize': '10pt',

    # Additional stuff for the LaTeX preamble.
    #
    # 'preamble': '',

    # Latex figure (float) alignment
    #
    # 'figure_align': 'htbp',
}

# Grouping the document tree into LaTeX files. List of tuples
# (source start file, target name, title,
#  author, documentclass [howto, manual, or own class]).
latex_documents = [
    (master_doc, 'psyplot-conda.tex', 'psyplot-conda Documentation',
     'Philipp S. Sommer', 'manual'),
]


# -- Options for manual page output ---------------------------------------

# One entry per manual page. List of tuples
# (source start file, name, description, authors, manual section).
man_pages = [
    (master_doc, 'psyplot-conda', 'psyplot-conda Documentation',
     [author], 1)
]


# -- Options for Texinfo output -------------------------------------------

# Grouping the document tree into Texinfo files. List of tuples
# (source start file, target name, title, author,
#  dir menu entry, description, category)
texinfo_documents = [
    (master_doc, 'psyplot-conda', 'psyplot-conda Documentation',
     author, 'psyplot-conda', 'One line description of project.',
     'Miscellaneous'),
]



# -- Options for Epub output ----------------------------------------------

# Bibliographic Dublin Core info.
epub_title = project
epub_author = author
epub_publisher = author
epub_copyright = copyright

# The unique identifier of the text. This can be a ISBN number
# or the project homepage.
#
# epub_identifier = ''

# A unique identification for the text.
#
# epub_uid = ''

# A list of files that should not be packed into the epub file.
epub_exclude_files = ['search.html']

# Example configuration for intersphinx: refer to the Python standard library.
intersphinx_mapping = {
    'psyplot': (
        'https://psyplot.readthedocs.io/en/latest/', None),
    'psy_maps': (
        'https://psyplot.readthedocs.io/projects/psy-maps/en/latest/', None),
    'psy_simple': (
        'https://psyplot.readthedocs.io/projects/psy-simple/en/latest/', None),
    'psy_reg': ('https://psyplot.readthedocs.io/projects/psy-reg/en/latest/',
                None),
    'psyplot_gui': (
        'http://psyplot.readthedocs.io/projects/psyplot-gui/en/latest/', None),
}
if six.PY3:
    intersphinx_mapping['python'] = ('https://docs.python.org/3.6/', None)
else:
    intersphinx_mapping['python'] = ('https://docs.python.org/2.7/', None)

# get link to conda files
url = "https://api.github.com/repos/Chilipp/psyplot-conda/releases/latest"
try:
    response = urlopen(url)
except Exception as e:
    logging.getLogger(__name__).warning(
        'Could not download latest psyplot-conda release from %s!', url,
        exc_info=True)
    psy_con_tag = 'v1.0.0'
else:
    s = response.read() if six.PY2 else response.read().decode()
    d = json.loads(s)
    psy_con_tag = d['tag_name']

psy_con_base = (
    'https://github.com/Chilipp/psyplot-conda/releases/download/%s' % (
        psy_con_tag))
psy_con_v = psy_con_tag[1:] if psy_con_tag.startswith('v') else psy_con_tag


extlinks = {
    'psycon': ('%s/psyplot-conda-%s-%%s' % (psy_con_base, psy_con_v), '')
    }
