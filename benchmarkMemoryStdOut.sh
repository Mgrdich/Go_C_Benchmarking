#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 <command-to-run> <output-file>"
    exit 1
fi

exec_file_name="$1"
output_file="$2"
leak_exist=false

if type -t leaks &> /dev/null; then
  leak_exist=true
  else
    echo "leak does not exists"
fi



# Clear the previous contents of the output file
# shellcheck disable=SC2188
> "$output_file"

if [ "$leak_exist" = true ]; then
   leaks --atExit -- "./$exec_file_name" >> "$output_file"
fi