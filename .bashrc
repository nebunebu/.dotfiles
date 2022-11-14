#!/bin/bash
###############################################################
#  ▄▄                            ▄▄                           #
#  ██                            ██                           #
#  ██▄███▄    ▄█████▄  ▄▄█████▄  ██▄████▄   ██▄████   ▄█████▄ #
#  ██▀  ▀██   ▀ ▄▄▄██  ██▄▄▄▄ ▀  ██▀   ██   ██▀      ██▀    ▀ #
#  ██    ██  ▄██▀▀▀██   ▀▀▀▀██▄  ██    ██   ██       ██       #
#  ███▄▄██▀  ██▄▄▄███  █▄▄▄▄▄██  ██    ██   ██       ▀██▄▄▄▄█ #
#  ▀▀ ▀▀▀     ▀▀▀▀ ▀▀   ▀▀▀▀▀▀   ▀▀    ▀▀   ▀▀         ▀▀▀▀▀  #
###############################################################

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

complete -cf doas
shopt -s checkwinsize >/dev/null

# ░█▀▀░█░█░█▀█░█▀▀░▀█▀░▀█▀░█▀█░█▀█░█▀▀
# ░█▀▀░█░█░█░█░█░░░░█░░░█░░█░█░█░█░▀▀█
# ░▀░░░▀▀▀░▀░▀░▀▀▀░░▀░░▀▀▀░▀▀▀░▀░▀░▀▀▀

# Open new terminal in last working directory
# And list directory when changing directories
# aliased to cd
# if [[ -f ~/.bash_lastdir ]]; then
#   source ~/.bash_lastdir
#   cd $LAST_DIR
# fi

cc() {
	if [ $# -eq 0 ]; then
		cd ~
		# ls --color=auto -A $PWD
		echo "LAST_DIR=$PWD" >~/.bash_lastdir
	else
		cd "$PWD/$1"
		# ls --color=auto -A $PWD
		echo "LAST_DIR=$PWD" >~/.bash_lastdir
	fi
}

# show-color() {
#     perl -e 'foreach $a(@ARGV){print "\e[48:2::".join(":",unpack("C*",pack("H*",$a)))."m \e[49m "};print "\n"' "$@"
# }
#
# term-colors () {
#   for x in {0..8}; do
#       for i in {30..37}; do
#           for a in {40..47}; do
#               echo -ne "\e[$x;$i;$a""m\\\e[$x;$i;$a""m\e[0;37;40m "
#           done
#           echo
#       done
#   done
#   echo ""
# }

mcd() {
	mkdir -p "$1"
	cd "$1"
}

ll() {
	ls --color=auto -lhAs
}

# clean () {
#   perl-rename 's/\d+/sprintf("%02d", $&)/e' *
#   perl-rename 's/\s+//g' *
#   rm *.srt
# }

# ░█▀█░█░░░▀█▀░█▀█░█▀▀░█▀▀░█▀▀
# ░█▀█░█░░░░█░░█▀█░▀▀█░█▀▀░▀▀█
# ░▀░▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀▀▀
# alias cd='cc'

# toilet font sample
# not working when aliased
#alias tfs='var=$(ls /usr/share/figlet/ | sed '/-/d' | sed 's/\..*$//g') && for i in ${var[@]}; do echo -e "\n\n$i"; toilet -f $i SAMPLE; done'

alias lynx='lynx -cfg=~/.lynx.cfg'
alias Screenshots='cd ~/Pictures/Screenshots'
alias Courses='cd ~/Downloads/Courses'
alias Books='cd ~/Downloads/Books'

alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias aao='cd ~/Documents/AAO/FS/01SoftwareEngineeringFoundations'

alias v='devour vlc'
alias z='devour zathura'
alias n='nvim'

# variables
aw="$HOME/.config/awesome/"
nv="$HOME/.config/nvim/lua/user/"
pj="$HOME/Projects"
#alias zeropad="perl-rename 's/\d+/sprintf("%02d",$&)/e' *"

PS1="\[\033[38;5;6m\][\[$(tput sgr0)\]\[$(tput bold)\]\W\[$(tput sgr0)\]\[\033[38;5;6m\]]\[$(tput sgr0)\]\[\033[38;5;3m\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/')\[$(tput sgr0)\]\[\033[38;5;6m\]\\$\[$(tput sgr0)\] \[$(tput sgr0)\]"

HISTSIZE=-1
HISTFILESIZE=-1

#colorized man pages
export LESS_TERMCAP_mb=$'\e[1;32m'
export LESS_TERMCAP_md=$'\e[1;32m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[01;33m'
export LESS_TERMCAP_ue=$'\e[0m'
export LESS_TERMCAP_us=$'\e[1;4;31m'

#swap esc and capslock
setxkbmap -option caps:swapescape

export EDITOR=/home/nebu/.local/bin/nvim
export PATH=$PATH:"$HOME/Scripts:$HOME/.local/:$HOME/.local/bin:$HOME/.local/share/gem/ruby/3.0.0/bin:$HOME/.cargo/bin:"
export LIBVIRT_DEFAULT_URI='qemu:///system'

eval "$(rbenv init - bash)"

LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=00:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.avif=01;35:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.webp=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*~=00;90:*#=00;90:*.bak=00;90:*.old=00;90:*.orig=00;90:*.part=00;90:*.rej=00;90:*.swp=00;90:*.tmp=00;90:*.dpkg-dist=00;90:*.dpkg-old=00;90:*.ucf-dist=00;90:*.ucf-new=00;90:*.ucf-old=00;90:*.rpmnew=00;90:*.rpmorig=00;90:*.rpmsave=00;90:'
export LS_COLORS

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
