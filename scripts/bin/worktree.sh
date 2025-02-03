#!/bin/bash

string_to_assoc_array() {
  local assoc_arr_str="$1"
  local assoc_arr_name="$2"

  IFS=',' read -r -a pairs <<< "$assoc_arr_str"

  for pair in "${pairs[@]}"; do
    IFS='=' read -r key value <<< "$pair"
    eval "$assoc_arr_name"["$key"]="$value"
  done
}

WORKTREE=$1

if [ -z "$WORKTREE" ]; then
   echo "Worktree is required."
   exit
fi

declare -A FILES_TO_LINK=()
if [ -n "$2" ]; then
   string_to_assoc_array "$2" "FILES_TO_LINK"
fi

declare -A DIRECTORIES_TO_COPY=()
if [ -n "$3" ]; then
   string_to_assoc_array "$3" "DIRECTORIES_TO_COPY"
fi

git worktree add $WORKTREE
git push -u origin $WORKTREE

for key in "${!FILES_TO_LINK[@]}"; do
   SOURCE=$key
   TARGET=${FILES_TO_LINK[$key]}
   ln -s $SOURCE $TARGET
done

for key in "${!DIRECTORIES_TO_COPY[@]}"; do
   SOURCE=$key
   TARGET=${DIRECTORIES_TO_COPY[$key]}
   cp -r $SOURCE $TARGET
done
