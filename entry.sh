#!/bin/bash

entry_folder=$1

if [ -z "$entry_folder" ]; then
    entry_folder=$ENTRY_DIR
fi

if [ -z "$entry_folder" ]; then
    entry_folder=$PWD
fi

cd "$entry_folder" || exit 1

year=$(date +'%Y')
month=$(date +'%m')
file_name=$(date +'%Y-%m-%d.md')
entry_file="$year/$month/$file_name"

if [ ! -f "$entry_file" ]; then
    mkdir -p "$year/$month"
    cp template.md "$entry_file"
fi

timestamp=$(date +'%a, %d %b %y, %I:%m %p')
echo -e "\n## $timestamp\n" >>"$entry_file"
${EDITOR:-vim} '+normal Go ' +startinsert "$entry_file"

if [ -n "$(git status --porcelain)" ]; then
    echo "entry: $timestamp"
    git pull --rebase --autostash >/dev/null 2>&1 &
    git add .
    git commit -m "$timestamp" >/dev/null 2>&1 &
    git push >/dev/null 2>&1 &
fi

cd - >/dev/null 2>&1 || exit
