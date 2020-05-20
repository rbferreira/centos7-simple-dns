#!/bin/bash
set -e

# allow arguments to be passed to named
if [[ ${1:0:1} = '-' ]]; then
  EXTRA_ARGS="$*"
  set -- 
elif [[ ${1} == named || ${1} == "$(command -v named)" ]]; then
  EXTRA_ARGS="${*:2}"
  set --
fi  

echo "Starting named..."
exec "$(command -v named)" -u ${BIND_USER} -g ${EXTRA_ARGS}
