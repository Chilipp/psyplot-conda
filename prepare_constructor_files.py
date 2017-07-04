# Python script to prepare the psyplot-conda constructor files
import sys
import six
import os.path as osp
import shutil
from itertools import chain
from collections import OrderedDict
import yaml
import pkg_resources
import datetime as dt
import subprocess as spr
import argparse
import glob
import pathlib


def file2html(fname):
    return pathlib.Path(osp.abspath(fname)).as_uri()


def pkg_type(s):
    return list(map(lambda s: osp.dirname(osp.join(s, '')), glob.glob(s)))

parser = argparse.ArgumentParser(
    description='Create files for the conda constructor package')

parser.add_argument('packages', nargs='*', type=pkg_type,
                    help=('The paths to the recipes to build and include as '
                          'locally built packages. They have to be installed '
                          'already!'))
parser.add_argument('-n', '--name', help=(
    "The conda environment name. If None, the current environment is used"))
parser.add_argument('-v', '--version', help='The version of the installer')
parser.add_argument('-i', '--input-dir', default='constructor-files',
                    help=("The directory that contains the raw files for the "
                          "conda constructor. Default: %(default)s"))
parser.add_argument('-o', '--output-dir', default='psyplot-conda',
                    help=("The directory for the final constructor files. "
                          "Default: %(default)s"))
parser.add_argument('-f', '--environment-file', default='environment.yml',
                    help=("The conda environment yaml file that contains the "
                          "specs to use for the constructor files. Default "
                          "%(default)s"))
parser.add_argument('--no-build', help="Do not build packages",
                    action='store_true')

args = parser.parse_args()

# get the version name
version = args.version or ''
if version.startswith('v'):
    version = version[1:]


def get_all_versions(name=None):
    list_cmd = 'conda list -e'.split()
    if name is not None:
        list_cmd += ['-n', name]
    all_versions_str = yaml.load(spr.check_output(list_cmd).decode('utf-8'))
    return {t[0]: t[1:] for t in map(lambda s: s.split('='),
                                     all_versions_str.split())}


all_versions = get_all_versions(args.name)


def get_version(mod, d=all_versions):
    try:
        return ' '.join(d[mod])
    except KeyError:
        return pkg_resources.get_distribution(mod).version


local_packages = list(chain.from_iterable(args.packages))

src_dir = args.input_dir

build_dir = args.output_dir

local_versions = OrderedDict([(pkg, get_version(pkg)[0]) for pkg in
                              map(osp.basename, local_packages)])

with open(args.environment_file) as f:
    other_pkgs = [
        pkg.split('=')[0] for pkg in yaml.load(f)['dependencies']
        if isinstance(pkg, six.string_types)]

other_versions = {pkg: get_version(pkg) for pkg in other_pkgs}


# delete old psyplot-conda files
try:
    shutil.rmtree(build_dir)
except Exception as e:
    pass

# copy raw files
shutil.copytree(src_dir, build_dir)


# ----------------------- End User License Agreement --------------------------

with open(osp.join(build_dir, 'EULA.txt')) as f:
    eula = f.read()

py_version = '.'.join(map(str, sys.version_info[:3]))

# replace versions
replacements = {}
replacements['VERSIONS'] = '\n'.join(
    '- %s: %s' % t for t in chain([('python', py_version)],
                                  sorted(local_versions.items()),
                                  sorted(other_versions.items())))

replacements['CONSTRUCTOR'] = get_version('constructor',
                                          get_all_versions('root'))

replacements['TIME'] = dt.datetime.now()

eula = eula.format(**replacements)

with open(osp.join(build_dir, 'EULA.txt'), 'w') as f:
    f.write(eula)

# ---------------------------- construct.yaml ---------------------------------

with open(osp.join(build_dir, 'construct.yaml')) as f:
    construct = yaml.load(f)

if version:
    construct['version'] = version

# use all installed packages in the given environment
construct['specs'] = ['python %s*' % py_version, 'conda', 'pip'] + [
    '%s %s' % (name, ' '.join(v)) for name, v in all_versions.items()]

# for packages in the psyplot framework, we use our own local builds
builds = []
for pkg_path in local_packages:
    if not args.no_build:
        spr.check_call(['conda', 'build', pkg_path, '--no-test'],
                       stdout=sys.stdout, stderr=sys.stderr)
    builds.append(file2html(spr.check_output(
        ['conda', 'build', pkg_path, '--output']).decode(
            'utf-8').strip()))
if builds:
    construct['packages'] = builds

with open(osp.join(build_dir, 'construct.yaml'), 'w') as f:
    yaml.dump(construct, f, default_flow_style=False)
