export PATH=$PATH:/usr/texbin

# usage: ro /path/to/eps/file/at/crossroads/figure.eps
function ro() {
  scp cross:${1%.eps}.{eps,dat,gp} /tmp
  open /tmp/$(basename $1) &
}
