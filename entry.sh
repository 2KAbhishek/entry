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

mkdir -p "$year/$month"
cp template.md "$year/$month/$file_name"
echo -e "## $(date +'%a %d %b %r')\n" >>"$year/$month/$file_name"
${EDITOR:-vim} '+normal Go ' +startinsert "$year/$month/$file_name"

folder="$(pwd | awk -F "/" '{print $NF}')"
timestamp=$(date +"%Y-%m-%d %T")

if [ -n "$(git status --porcelain)" ]; then
    echo "$folder entry: $timestamp"
    git pull --rebase --autostash >/dev/null 2>&1 &
    git add .
    git commit -m "$folder Entry: $timestamp" >/dev/null 2>&1 &
    git push >/dev/null 2>&1 &
fi

cd - >/dev/null 2>&1 || exit
