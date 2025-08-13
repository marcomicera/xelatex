#!/bin/sh

if [ -n "$OUTPUT_FILENAME" ]; then
  echo "📄 Output filename specified: $OUTPUT_FILENAME.pdf"
  xelatex -jobname="$OUTPUT_FILENAME" "$@"
else
  echo "📄 Using default output filename."
  xelatex "$@"
fi
