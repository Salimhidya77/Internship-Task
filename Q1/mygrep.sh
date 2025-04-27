#!/bin/bash

# print help message .

print_help() {
  echo "Usage: $0 [options] search_string filename"
  echo "Options:"
  echo "  -n    Show line numbers"
  echo "  -v    Invert match"
  echo "  --help Display this help message"
}

# Check for --help .

if [[ "$1" == "--help" ]]; then
  print_help
  exit 0
fi

# Initialize options .

show_line_numbers=false
invert_match=false

# Parse options .

while getopts ":nv" opt; do
  case $opt in
    n)
      show_line_numbers=true
      ;;
    v)
      invert_match=true
      ;;
    \?)
      echo "Invalid option: -$OPTARG" >&2
      print_help
      exit 1
      ;;
  esac
done


shift $((OPTIND -1))

# Check for required arguments

if [ "$#" -lt 2 ]; then
  echo "Error: Missing search string or filename."
  print_help
  exit 1
fi

search_string="$1"
filename="$2"

# Check if file exists
if [ ! -f "$filename" ]; then
  echo "Error: File '$filename' not found."
  exit 1
fi

# Build grep .

grep_options=""

if $show_line_numbers; then
  grep_options+=" -n"
fi

if $invert_match; then
  grep_options+=" -v"
fi

# Run grep .

grep $grep_options "$search_string" "$filename"
