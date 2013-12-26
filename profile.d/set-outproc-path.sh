#
# Set Pluggable Output Processor binary path before others (if package installed)
#

if [ -d /usr/lib/outproc/bin ]
then
    export PATH="/usr/lib/outproc/bin:$PATH"
fi
