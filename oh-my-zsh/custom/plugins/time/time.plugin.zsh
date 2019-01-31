typeset -g geometry_time_human

_prompt_geometry_time_long_format() {
  local human=""
  local days=$1
  local hours=$2
  local minutes=$3
  local seconds=$4

  (( days > 0 )) && human+="${days}d "
  (( hours > 0 )) && human+="${hours}h "
  (( minutes > 0 )) && human+="${minutes}m "
  human+="${seconds}s"

  geometry_time_human=$human
}

_prompt_geometry_time_short_format() {
  local human=""
  local days=$1
  local hours=$2
  local minutes=$3
  local seconds=$4

  if (( days > 0 )); then
    human="${days}d"
  elif (( hours > 0 )); then
    human="${hours}h"
  elif (( minutes > 0 )); then
    human="${minutes}m"
  else
    human="${seconds}s"
  fi

  geometry_time_human=$human
}

_prompt_geometry_seconds_to_human_time() {
  local total_seconds=$(_prompt_geometry_git_time_since_commit)
  # local total_seconds=$1

  local days=$(( total_seconds / 60 / 60 / 24 ))
  local hours=$(( total_seconds / 60 / 60 % 24 ))
  local minutes=$(( total_seconds / 60 % 60 ))
  local seconds=$(( total_seconds % 60 ))

  # It looks redundant but it seems it's not
  _prompt_geometry_time_short_format $days $hours $minutes $seconds

  echo $geometry_time_human
}

_prompt_geometry_git_time_since_commit() {
  # Defaults to "", which would hide the git_time_since_commit block
  local git_time_since_commit=""

  # Get the last commit.
  local last_commit=$(git log -1 --pretty=format:'%at' 2> /dev/null)
  if [[ -n $last_commit ]]; then
      now=$(date +%s)
      seconds_since_last_commit=$((now - last_commit))
      git_time_since_commit=$seconds_since_last_commit
  fi

  echo $git_time_since_commit
}

_git_time_since_commit() {
  _prompt_geometry_seconds_to_human_time
}
