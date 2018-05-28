if [ -f /etc/bashrc ]; then
  . /etc/bashrc
fi

export LC_ALL=en_US.utf8
export TERM=rxvt-unicode

alias ls="ls --color"

parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ «\1/'
}
get_git_state() {
  o=$(git status 2>/dev/null)
  if [ $? -eq 0 ]; then
    echo "$o" |grep -q clean && echo -n '»' || echo -n '*»'
  fi
}
export PS1="\u@\h \[\033[32m\]\w\[\033[33m\]\$(parse_git_branch)\$(get_git_state)\[\033[00m\] \$ "
