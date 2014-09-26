function gds {
  git diff $1..$2 | eval $EDITOR
}