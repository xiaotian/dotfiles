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
#pyenv initialization
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

# python stuff
export PYTHONSTARTUP=~/.python_startup.py

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# set jdk/java version
# http://stackoverflow.com/questions/21964709/how-to-change-default-java-version
export JAVA_HOME='/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home'

# stop terminal from handling ctrl-q and ctrl-s
# we use ctrl-q in emmet.vim as leader key
stty start undef
stty stop undef

