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

# for building android facebook/phone app
export ANDROID_HOME=/Users/tian/android-sdk
export ANDROID_NDK=/Users/tian/android-ndk/android-ndk-r10e
export JAVA_HOME=`/usr/libexec/java_home -v 1.8`

gvpn() {
  sudo route -n change 192.168.1.0/24 -interface vboxnet1
  sudo route -n delete 192.168.1.0/24 -interface vboxnet1
  sudo route -n add 192.168.1.0/24 -interface vboxnet1
}

gvpnoff() {
  sudo route -n delete 192.168.1.0/24 -interface vboxnet1
}
