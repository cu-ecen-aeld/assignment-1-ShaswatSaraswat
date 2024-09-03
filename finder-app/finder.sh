#!/bin/bash

#author Shaswat Saraswat
# Check if both arguments are provided
if [ "$#" -ne 2 ]; then
    echo "Error: Two arguments required."
    echo "Usage: $0 <filesdir> <searchstr>"
    exit 1
fi

# Assign arguments to variables
filesdir="$1"
searchstr="$2"

# Check if filesdir is a directory
if [ ! -d "$filesdir" ]; then
    echo "Error: '$filesdir' is not a valid directory."
    exit 1
fi

# Initialize counters
file_count=0
line_count=0

# Find files and count them
while IFS= read -r -d '' file; do
    file_count=$((file_count + 1))
    # Count matching lines in the current file
    matching_lines=$(grep -c "$searchstr" "$file")
    line_count=$((line_count + matching_lines))
done < <(find "$filesdir" -type f -print0)

# Print the results
echo "The number of files are $file_count and the number of matching lines are $line_count"

exit 0
