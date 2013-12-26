#
# Function to save and reload history from the current shell.
# Can be used to flush (and remember) commands for future use
# in case when session close can be terminated unexpectedly
# (i.e. w/o calling logout) -- for example, when `konsole`
# window w/ a bunch of tabs gets closed...
#

function save_and_reload_history()
{
    history -a
    history -c
    history -r
}
