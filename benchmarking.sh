#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 <command-to-run> <output-file>"
    exit 1
fi

command_to_run="$1"
output_file="$2"

# Clear the previous contents of the output file
# shellcheck disable=SC2188
> "$output_file"

# Loop to run the command multiple times
for i in {1..10}; do
    echo "Run $i"
    { time "$command_to_run" ; } 2>> "$output_file"
done
