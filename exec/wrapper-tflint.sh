#!/bin/bash +e

_FILES=$(printf '%s' "$1" | jq -r '.[]')

for _FILE in $_FILES
do
  if [ "${_FILE: -3}" == ".tf" ]; then
    tflint -f checkstyle "$_FILE" -c "$2" | reviewdog -f=checkstyle -reporter=github-pr-review
  fi
done
