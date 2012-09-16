#!/bin/bash - 
#===============================================================================
#
#         USAGE:  ./util.sh 
# 
#   DESCRIPTION:  misc bash useful functions
# 
#        AUTHOR: Ming Chen, mchen@cs.stonybrook.edu
#
#===============================================================================

set -o nounset                          # treat unset variables as an error
set -o errexit                          # stop script if command fail
export PATH="/bin:/usr/bin:/sbin"             
IFS=$' \t\n'                            # reset IFS
unset -f unalias                        # make sure unalias is not a function
\unalias -a                             # unset all aliases
ulimit -H -c 0 --                       # disable core dump
hash -r                                 # clear the command path hash

function spin_up() {
	hdparm -S 0 "$@"
	for i in "$@"; do
		# do some I/O to make sure disks are up
		dd if=$i of=/dev/null bs=4k count=10 >/dev/null 2>&1
	done
}

function spin_down() {
	hdparm -y "$@"
}

function power_down() {
	hdparm -Y "$@"
}

function get_status() {
	hdparm -C "$@"
}

function wattsup_measure() {
	# Setup the Watts up Pro
	wattsup /dev/ttyUSB0  "#C,W,18,1,0,0,1,0,0,0,0,0,0,0,0,0,0,0,0,0,0;" s

	# Starting a new combination
	# Resetting the Wattsup Pro to internal logging every 1 sec
	wattsup /dev/ttyUSB0  "#L,W,3,I,0,1;" s

	# run and measure
	echo "measuring ..."
	sleep 60s

	# retrieve power and energy data from the wattsup power meter
	#wattsup /dev/ttyUSB0  "#D,R,0;" r | grep "#d" | cut -d ',' -f 5 > "watts.log"
	#wattsup /dev/ttyUSB0  "#D,R,0;" r | grep "#d" | cut -d ',' -f 8 > "energy.log"
	wattsup /dev/ttyUSB0  "#D,R,0;" r | 
		awk -v FS=',' '
			BEGIN { powersum = 0; n = 0; lastenergy = 0; }
			($2 == "#d") { powersum += $5; n += 1; lastenergy = $8; }
			END { printf("average-power: %.1f\ntotal-energy: %.1f\n", powersum/n, lastenergy); }
		' -
}

function get_mean_var() {
	awk '
		BEGIN { sum = 0; n = 0; }
		($1 == "energy") {energy[n++] = $1; sum += $1;}
		END { 
			avg = sum / n;
			dv = 0;
			for (i = 0; i < n; ++i) {
				dv += (energy[i] - avg) * (energy[i] - avg);
			}
			stdv = sqrt(dv / n);
			var = 2 * stdv / sqrt(n);
			printf("%.3f\t%.3f\n", avg, var);
		}
	' -
}
