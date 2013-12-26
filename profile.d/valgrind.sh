#
# A wrapper around valgrind to load configured suppressions on execute
#

function valgrind()
{
    local suppress_options
    local sf
    if [ -d ~/.valgrind ]; then
        for sf in ~/.valgrind/*.supp; do
            suppress_options="$suppress_options --suppressions=$sf"
        done
    fi
    /usr/bin/valgrind $suppress_options $*
}
