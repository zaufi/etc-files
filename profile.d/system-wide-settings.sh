#
# System-wide aliases and options I use for a long time
#

#
# My favorite aliases
#

# Filesystem related
alias du0='du -hs'
alias du1='du -h --max-depth=1'
alias ll='ls -FlA --color=auto --group-directories-first --indicator-style=file-type'
alias ls='ls --color=auto'

# System and Monitoring
alias top='htop'
alias sc='systemctl'

# Development related
alias info='pinfo'
alias diff='diff -u'
alias strace='strace -s 80 -a 60'
alias g++11='g++ -std=c++11'
alias clang++11='clang++ -std=c++11'
alias g++14='g++ -std=c++14'
alias clang++14='clang++ -std=c++14'
alias g++17='g++ -std=c++17'
alias clang++17='clang++ -std=c++17'
alias g++20='g++ -std=c++2a'
alias clang++20='clang++ -std=c++2a'

#
# Setup shell options
#
shopt -q -s \
    autocd \
    cdable_vars \
    cdspell \
    checkhash \
    cmdhist \
    dirspell \
    dotglob \
    extglob \
    histappend \
    no_empty_cmd_completion

# Make bash completion work for (some) my aliases
make_completion_wrapper _systemctl _sc systemctl
complete -o bashdefault -o default -F _sc sc
