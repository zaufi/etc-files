#
# Make dir and go to it
#

function mkcd()
{
    local dir="$1"
    mkdir -p "$dir" && cd "$dir"
}
