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
touch "$year/$month/$file_name"
$EDITOR "$year/$month/$file_name"

folder="$(pwd | awk -F "/" '{print $NF}')"
timestamp=$(date +"%Y-%m-%d %T")

if ! git diff --quiet; then
    git add .
    git commit -m "$folder Entry: $timestamp" >/dev/null 2>&1 &
    echo "$folder Entry: $timestamp"
    (git pull --rebase --autostash && git push) >/dev/null 2>&1 &
fi

cd - >/dev/null 2>&1 || exit
