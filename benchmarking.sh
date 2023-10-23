#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 <command-to-run> <output-file>"
    exit 1
fi

command_to_run="$1"
output_file="$2"
include_size=false

# Check if a third argument is provided to include ls -lh
if [ -n "$3" ] && [ "$3" = "--size" ]; then
    include_size=true
fi

# Clear the previous contents of the output file
# shellcheck disable=SC2188
> "$output_file"

# Loop to run the command multiple times
for i in {1..10}; do
     {
              echo "------------------Run $i---------------" >> "$output_file"

              if [ "$include_size" = true ]; then
              eval "ls -lh $command_to_run | awk '{print $2}'" >> "$output_file"
              fi

              eval "time $command_to_run"
              echo "---------------------------------------" >> "$output_file"
          } 2>> "$output_file"
done
