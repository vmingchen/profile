export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/texbin:"

export PATH=/usr/local/Library/Canopy/User/bin:$PATH:/usr/texbin:/opt/local/bin

function jabref() {
  nohup java -jar /Applications/JabRef.app/Contents/Resources/Java/JabRef-2.10.jar 1>/dev/null 2>&1 &
}

# usage: ro /path/to/eps/file/at/crossroads/figure.eps
function ro() {
  scp cross:${1%.eps}.{eps,dat,gp} /tmp
  open /tmp/$(basename $1) &
}

# ignore .DS_Store file
export FIGNORE=DS_Store

export CVS_RSH=ssh
export CLICOLOR=1
