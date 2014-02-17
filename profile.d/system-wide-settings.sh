#
# System-wide aliases and options I use for a long time
#

# My favorite aliases
alias du0='du -hs'
alias du1='du -h --max-depth=1'
alias ll='ls -FlA --color=auto --group-directories-first --indicator-style=file-type'
alias ls='ls --color=auto'
alias screen='screen -U'
alias top='htop'

alias diff='diff -u'
alias strace='strace -s 80 -a 60'
alias g++11='g++ -std=c++11'
alias clang++11='clang++ -std=c++11'

# Setup shell options
shopt -q -s autocd
shopt -q -s cdable_vars
shopt -s cdspell
shopt -s dirspell
shopt -s checkhash
shopt -s extglob
shopt -s dotglob
shopt -s cmdhist
shopt -s histappend
shopt -s no_empty_cmd_completion
