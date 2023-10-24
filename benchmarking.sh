#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]; then
    echo "Usage: $0 <command-to-run> <output-file>"
    exit 1
fi

command_to_run="$1"
output_file="$2"
exec_file_name="$3"


# Clear the previous contents of the output file
# shellcheck disable=SC2188
> "$output_file"

# Loop to run the command multiple times
for i in {1..10}; do
     {
              echo "------------------Run $i---------------" >> "$output_file"

              if [ -n "$3" ]; then

                    echo "Size of the binary" >>  "$output_file"
                    du -h "$exec_file_name" >> "$output_file"

              fi

              eval "time $command_to_run"

              echo "---------------------------------------" >> "$output_file"
          } 2>> "$output_file"
done
