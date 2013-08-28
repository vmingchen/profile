#!/usr/bin/env python
'''Logging utilities.

To print stacktrace, specify 'exc_info = True'. For example:
  ERROR('Error Message', exc_info = True)
'''

import sys
import logging

def GetLoggers(module_name):
  logging.basicConfig(level=logging.WARN)
  logger = logging.getLogger(module_name)
  module = sys.modules[module_name]
  setattr(module, 'DEBUG', getattr(logger, 'debug'))
  setattr(module, 'INFO', getattr(logger, 'info'))
  setattr(module, 'WARN', getattr(logger, 'warning'))
  setattr(module, 'ERROR', getattr(logger, 'error'))
  setattr(module, 'FATAL', getattr(logger, 'critical'))


def SetLogLevel(module_name, log_level):
  key = log_level[0].upper()
  level_dict = {'D': logging.DEBUG,
                'I': logging.INFO,
                'W': logging.WARN,
                'E': logging.ERROR,
                'F': logging.FATAL}
  logger = logging.getLogger(module_name)
  logger.info('Setting logging level to ' + log_level)
  logger.setLevel(level_dict[key])
