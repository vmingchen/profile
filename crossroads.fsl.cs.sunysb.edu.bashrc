export JAVA_HOME=/home/mchen/software/jdk1.8.0_20
export PATH=$JAVA_HOME/bin:$PATH
export PATH=$HOME/software/bin:$PATH
export LD_LIBRARY_PATH=/home/mchen/software/lib64:/home/mchen/software/lib:$LD_LIBRARY_PATH
export TMPDIR=/scratch/tmp

alias open='xdg-open'

# Added by Canopy installer on 2014-10-30
# VIRTUAL_ENV_DISABLE_PROMPT can be set to '' to make bashprompt show that Canopy is active, otherwise 1
VIRTUAL_ENV_DISABLE_PROMPT=1 source /home/mchen/Enthought/Canopy_64bit/User/bin/activate
