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
