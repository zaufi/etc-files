#
# Make a random password of desired length
#

function mkpasswd()
{
    < /dev/urandom tr -dc '_A-Z-a-z-0-9`~!@#$%^&*-=+|\?,./\\<>' | head -c${1:-$1} ;echo;
}
