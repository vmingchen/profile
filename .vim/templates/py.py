#!/usr/bin/env python
'''
'''

import gflags
import os

from util.log import GetLoggers,SetLogLevel

GetLoggers(__name__)
FLAGS = gflags.FLAGS

gflags.DEFINE_boolean('debug', False, 'produces debugging output')

def main(argv):
  # TODO

if __name__ == '__main__':
  try:
    argv = FLAGS(sys.argv)  # parse flags
  except gflags.FlagsError, e:
    print('%s\\nUsage: %s ARGS\\n%s' % (e, sys.argv[0], FLAGS))
    sys.exit(1)
  if FLAGS.debug:
    print('non-flag arguments: %s' % argv)
    SetLogLevel(__name__, 'Debug')
  main(argv)

# vim:set sr et ts=2 sw=2 ft=python fenc=utf-8: // See Vim, :help 'modeline'
