#
# Set Pluggable Output Processor binary path before others (if package is installed)
#

if [ -d /usr/lib/outproc/bin ]
then
    PATH="/usr/lib/outproc/bin:$PATH"
fi
