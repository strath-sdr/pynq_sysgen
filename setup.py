# library
import os
from setuptools import find_packages, setup
from distutils.dir_util import copy_tree

# variable
package_name = "pynq_sysgen"
board = os.environ['BOARD']
board_notebooks = os.path.join(os.environ['PYNQ_JUPYTER_NOTEBOOKS'], 'pynq-system-generator')

# function
def copy_bitstreams(brd, pkgname):
    for directory in os.walk(os.path.join(os.getcwd(), 'boards', brd)):
        for file in directory[2]:
            if (file.find('.bit') != -1):
                project = os.path.split(os.path.split(directory[0])[0])[1]
                dst = os.path.join(os.getcwd(), pkgname, 'notebooks', project, 'bitstream')
                copy_tree(directory[0], dst)

def generate_pkg_dirs(pkgname):
    data_files = []
    for directory in os.walk(os.path.join(os.getcwd(), pkgname)):
        for file in directory[2]:
            data_files.append("".join([directory[0],"/",file]))
    return data_files

copy_bitstreams(board, package_name)

# setuptools
setup(
    name=package_name,
    version='1.0',
    install_requires=[],
    author="strath-sdr",
    packages=find_packages(),
    package_data={"" : generate_pkg_dirs(package_name)},
    description="System Generator projects for PYNQ.")
