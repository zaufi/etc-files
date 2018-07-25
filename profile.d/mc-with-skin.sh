#
# A wrapper around `mc` to use a skin according to the terminal supportable colors
#

function mc()
{
    local -r colors=$(tput colors)
    local skin
    if [[ ${colors} = 16777216 && -f /etc/mc/skins/default-16M.ini ]]; then
        skin=/etc/mc/skins/default-16M.ini

    # 256, 16 and 8 color terminals
    elif [[ -f /etc/mc/skins/default-${colors}.ini ]]; then
        skin=/etc/mc/skins/default-${colors}.ini

    # Ok, try the very default skin
    elif [[ -f /etc/mc/skins/default.ini ]]; then
        skin=/etc/mc/skins/default.ini
    fi

    # Midnight Commander chdir enhancement
    if [[ -f /usr/libexec/mc/mc-wrapper.sh ]]; then
        . /usr/libexec/mc/mc-wrapper.sh ${skin:+--skin=${skin}}
    else
        /usr/bin/mc ${skin:+--skin=${skin}}
    fi
}
