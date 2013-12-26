#
# Better `which`
#

function which ()
{
    (alias; declare -f) | /usr/bin/which --tty-only --read-alias --read-functions --show-dot --show-tilde $@
}
