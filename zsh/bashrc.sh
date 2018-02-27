reload_shell() {
  clear; exec $SHELL -l;
  load_sources
}

load_sources() {
  source $ZSHFILES/exports.sh
  source $ZSHFILES/functions.sh
  source $ZSHFILES/alias.sh
}
