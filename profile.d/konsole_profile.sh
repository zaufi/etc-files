#
# Change current color scheme of running `konsole` session
#

function set_konsole_color_scheme()
{
    local scheme=$1
    [ -n "${KONSOLE_DBUS_SESSION}" ] && /usr/bin/konsoleprofile colorscheme=$scheme
}
