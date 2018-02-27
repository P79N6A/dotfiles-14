#!/bin/bash

install() {
  local bindir="$(grep -E "^([^:]+)" -io <<<"${PATH}")"
  if [[ ! -e "${bindir}" ]]; then
    echo -e "
    error: not found bin dir \"${bindir}\"
    "; return 1
  else
    echo -e "
    Installing...gctools
    "
    if [[ ! -e "./gctools.sh" ]]; then
      echo -e "
      error: not found \"gctools.sh\"
      "; return 1
    else
      # sudo cp ./gctools.sh /usr/local/bin/gctools
      # echo -e "
      # Completed...
      # Please remove gctools.sh after installed
      # "; return 0
      echo -ne 'source $HOME/.dotfiles/zshrc.sh' > "${HOME}/.zshrc"
      echo -e "Please re-login to refresh shell"

      return 0
    fi
  fi
}

# Check if the function exists (bash specific)
if declare -f "$1" > /dev/null
then
  # call arguments verbatim
  "$@"
  complete 0
else
  # Show a helpful error
  echo "'$1' is not a known function name" >&2
  complete 1
fi
