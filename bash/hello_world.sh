#!/bin/sh
#
# Copyright 2008 Kate Ward. All Rights Reserved.
# Released under the LGPL (GNU Lesser General Public License)
#
# Author: kate.ward@forestent.com (Kate Ward)
#
# This is the proverbial 'Hello, world!' script to demonstrate the most basic
# functionality of shFlags.
#
# This script demonstrates accepts a single command-line flag of '-n' (or
# '--name'). If a name is given, it is output, otherwise the default of 'world'
# is output.

# source shflags
. ./shflags
LOG4SH_CONFIGURATION='none' . ./log4sh

# define a 'name' command-line string flag
DEFINE_string 'name' 'world' 'name to say hello to' 'n'

# parse the command-line
FLAGS "$@" || exit 1
eval set -- "${FLAGS_ARGV}"

# change the default message level from ERROR to INFO
logger_setLevel INFO

# say hello to the world
logger_info "Running Hello..."
echo "Hello, ${FLAGS_name}!"
