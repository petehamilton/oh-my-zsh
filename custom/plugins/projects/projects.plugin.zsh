c() { cd $PROJECTS/$1;  }

_c() { _files -W $PROJECTS -/; }
compdef _c c

clone_project() { c; git clone $1 }
