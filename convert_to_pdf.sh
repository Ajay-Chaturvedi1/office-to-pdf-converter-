#!/bin/bash

# Check if arguments are provided
if [ $# -eq 0 ]; then
        echo "Usage: $0 <file1> [file2...]"
        exit 1
else

# All converted files will be stored here
OUTPUT_DIR="./OUTPUT"
mkdir -p "$OUTPUT_DIR"

# Loop through each file and convert to PDF
for file in "$@"; do
        if [ ! -f "$file" ]; then
                echo "$file file not found"
                continue
        fi

        echo "Converting: $file"

        libreoffice --headless --convert-to pdf "$file" --outdir "$OUTPUT_DIR"

        if [ $? -eq 0 ]; then
                echo "$file successfully converted into pdf."
        else
                echo "failed to convert $file into pdf"
        fi
done

echo "All convertions are completed successfully and stored in $OUTPUT_DIR"
fi
