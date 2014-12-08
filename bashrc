source ~/.bash/aliases
source ~/.bash/completions
source ~/.bash/paths
source ~/.bash/config
source ~/.bash/jump

# use .localrc for settings specific to one system
if [ -f ~/.localrc ]; then
  source ~/.localrc
fi

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# python stuff
export PYTHONSTARTUP=~/.pythonrc.py

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# stop terminal from handling ctrl-q and ctrl-s
# we use ctrl-q in emmet.vim as leader key
stty start undef
stty stop undef
