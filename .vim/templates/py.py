#!/usr/bin/env python
'''

by Ming Chen, v.mingchen@gmail.com
'''

import gflags
import os
import sys

from myutil.log import GetLoggers,SetLogLevel

GetLoggers(__name__)
FLAGS = gflags.FLAGS

gflags.DEFINE_string('logging_level', 'INFO', 'DEBUG, INFO, WARN, or FATAL')

def main(argv):
  # TODO

if __name__ == '__main__':
  try:
    argv = FLAGS(sys.argv)  # parse flags
  except gflags.FlagsError, e:
    print('%s\nUsage: %s ARGS\n%s' % (e, sys.argv[0], FLAGS))
    sys.exit(1)

  SetLogLevel(__name__, FLAGS.logging_level)

  INFO('non-flag arguments: %s' % argv)

  main(argv)

# vim:set sr et ts=2 sw=2 ft=python fenc=utf-8: // See Vim, :help 'modeline'
