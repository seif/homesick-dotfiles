# Share history across multiple shells
# Taken from http://unix.stackexchange.com/questions/1288/preserve-bash-history-in-multiple-terminal-windows

export HISTCONTROL=ignoredups:erasedups  # no duplicate entries
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it
shopt -s histverify                      # edit a recalled history line before executing

# Save and reload the history after each command finishes
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
