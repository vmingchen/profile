alias gateway='ssh -p 130 mchen@130.245.191.165'
alias tunnel5='ssh -p 130 -N -L 22222:ubuntu5:22 mchen@130.245.191.165'
# usage: scp4 mchen@localhost:/path/to/file/on/ubuntu5 /local/path
alias scp5='scp -P 22222'
alias vm='ssh mchen@130.245.126.180'
export PATH=$PATH:/home/mchen/software/bin
