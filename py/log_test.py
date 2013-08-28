#!/usr/bin/env python
from log import GetLoggers,SetLogLevel

GetLoggers(__name__)

if __name__ == '__main__':
  for level in ['D', 'I', 'W', 'E', 'F']:
    print('Logging level set to ' + level)
    SetLogLevel(__name__, level)
    DEBUG('DEBUG')
    INFO('INFO')
    WARN('WARN')
    ERROR('ERROR')
    FATAL('FATAL')
