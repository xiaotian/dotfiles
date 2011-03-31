if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

export PS1="[\u@\h \W \`git branch 2> /dev/null | grep -e ^* | sed -E  s/^\\\\\\\\\*\ \(.+\)$/\(\\\\\\\\\1\)\ /\`\[\033[37m\]$\[\033[00m\]]"
