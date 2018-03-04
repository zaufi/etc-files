#
# A wrapper around `mc` to use a skin according to terminal supportable colors
#

function mc()
{
    local -r colors=$(tput colors)
    if [[ -f /etc/mc/skins/default-${colors}.ini ]]; then
        skin=/etc/mc/skins/default-${colors}.ini
    elif [[ -f /etc/mc/skins/default.ini ]]; then
        skin=/etc/mc/skins/default.ini
    fi
    # Midnight Commander chdir enhancement
    if [ -f /usr/libexec/mc/mc-wrapper.sh ]; then
        . /usr/libexec/mc/mc-wrapper.sh ${skin:+--skin=${skin}}
    else
        /usr/bin/mc ${skin:+--skin=${skin}}
    fi
}
