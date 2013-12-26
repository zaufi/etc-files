#
# Show difference between installed package and the same in the portage tree
#

function pkg-meta-diff()
{
    local pkg=$1
    local i
    for i in `ls /var/db/pkg/${pkg}*/*.ebuild`; do
        diff --color=always -u $i /usr/portage/$pkg/`basename $i` | less
    done
}
