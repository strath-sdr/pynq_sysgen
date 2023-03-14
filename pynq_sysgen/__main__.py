# library
import sys
import os
import subprocess
import shutil
from distutils.dir_util import copy_tree

# variables
notebook_dir = 'pynq-system-generator'

# dialogue
help_dialogue = ''.join(['\r\nThe pynq-sysgen module accepts one of the following arguments:', '\r\n',
                         '* install : Installs the notebooks and packages to the Jupyter directory', '\r\n',
                         '* uninstall : Uninstalls the notebooks and packages from the Jupyter directory', '\r\n',
                         '* clean : Returns the notebooks to their original states', '\r\n',
                         '* help : Displays this dialogue', '\r\n'])

error_dialogue = '\r\nUnknown error occurred.\r\n'

# check arguments
args = sys.argv
if len(args) > 2:
    raise RuntimeError(help_dialogue)
    
arg = args[1]
if arg not in ['install', 'uninstall', 'clean', 'help']:
    raise ValueError(help_dialogue)
    
# define functions
def install_notebooks():
    print('\r\n***** Installing Notebooks *****\r\n')
    dst = get_notebook_dst()
    src = os.path.abspath(os.path.join(os.path.realpath(__file__), '..', 'notebooks'))
    if os.path.exists(dst):
        raise RuntimeError(''.join(['Notebooks already installed. ',
                                    'Please uninstall notebooks before reinstalling.\r\n']))
    if not os.path.exists(src):
        raise RuntimeError(''.join(['Path does not exist: ', src, '\r\n']))
    copy_tree(src, dst)
    logfile = os.path.abspath(os.path.join(os.path.realpath(__file__), '..', 'install.txt'))
    with open(logfile, 'w') as f:
        f.write(dst)

def uninstall_notebooks():
    print('\r\n***** Uninstalling Notebooks *****\r\n')
    logfile = os.path.abspath(os.path.join(os.path.realpath(__file__), '..', 'install.txt'))
    if not os.path.exists(logfile):
        raise RuntimeError('Notebooks do not have an install location. Nothing has been removed.\r\n')
    with open(logfile, 'r') as f:
        dst = f.readline()
    if not os.path.exists(dst):
        raise RuntimeError('Notebooks are not installed. Nothing has been removed.\r\n')
    shutil.rmtree(dst)
    os.remove(logfile)
    print('Notebooks uninstalled successfully.\r\n')

def clean_notebooks():
    print('\r\n***** Cleaning Notebooks *****\r\n')
    uninstall_notebooks()
    install_notebooks()
    print('Notebooks cleaned successfully\r\n')

def get_notebook_dst():
    if 'PYNQ_JUPYTER_NOTEBOOKS' not in os.environ:
        dialogue = 'Not using a PYNQ board: Error.'
        raise RuntimeError(dialogue)
    dst = os.path.join(os.environ['PYNQ_JUPYTER_NOTEBOOKS'], notebook_dir)
    dialogue = ''.join(['Using a PYNQ board. ',
                        'Installing notebooks to the PYNQ Jupyter directory: ',
                        dst, '\r\n'])
    print(dialogue)
    return dst

# run script
if arg == 'install':
    install_notebooks()
    print('Notebooks installed successfully\r\n')
elif arg == 'uninstall':
    uninstall_notebooks()
    print('Notebooks uninstalled successfully\r\n')
elif arg == 'clean':
    clean_notebooks()
elif arg == 'help':
    print(help_dialogue)
else:
    raise RuntimeError(error_dialogue)
    