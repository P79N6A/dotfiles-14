foo() {
  echo 'FOO'
}

# Check if the function exists (bash specific)
if declare -f "$1" > /dev/null
then
  # call arguments verbatim
  "$@"
  return 0
else
  # Show a helpful error
  echo "'$1' is not a known function name" >&2
  return 1
fi
