# python startup file
import readline
import rlcompleter
import atexit
import os
from os import path
import sys
from datetime import datetime
from pprint import pprint
from timeit import timeit
from collections import namedtuple
from collections import defaultdict

assert datetime
assert pprint
assert sys
assert timeit

try:
    from see import see
except:
    print('see module not installed')
else:
    assert see


#  tab completion
if 'libedit' in readline.__doc__:
    readline.parse_and_bind("bind ^I rl_complete")
else:
    readline.parse_and_bind("tab: complete")

# history file
histfile = path.join(os.environ['HOME'], '.pythonhistory')
try:
    readline.read_history_file(histfile)
except IOError:
    pass
atexit.register(readline.write_history_file, histfile)
del histfile, readline, rlcompleter
print("^_^ type away")
