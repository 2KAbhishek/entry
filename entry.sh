#!/bin/bash

entry_folder=$1

if [ -z "$entry_folder" ]; then
    entry_folder=$ENTRY_DIR
fi

cd "$entry_folder" || exit 1

year=$(date +'%Y')
month=$(date +'%m')
file_name=$(date +'%Y-%m-%d.md')

mkdir -p "$year/$month"
touch "$year/$month/$file_name"
$EDITOR "$year/$month/$file_name"

folder="$(pwd | awk -F "/" '{print $NF}')"
timestamp=$(date +"%Y-%m-%d %T")

git add .
git commit -m "$folder Entry: $timestamp"
git pull --rebase --autostash
git push

cd - || exit
