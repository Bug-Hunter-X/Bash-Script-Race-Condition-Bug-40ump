#!/bin/bash

# This script demonstrates a solution to the race condition bug using flock.

# Create two files
touch file1.txt
touch file2.txt

# Function to write to a file with locking
write_to_file() {
  local file=$1
  local message=$2
  flock -x "$file" || exit 1  # Acquire exclusive lock
  echo "$message" >> "$file"
  flock -u "$file" # Release the lock
}

# Start two processes simultaneously
(while true; do write_to_file file1.txt "Process 1: $(date)"; sleep 1; done) &
(while true; do write_to_file file2.txt "Process 2: $(date)"; sleep 1; done) &

# Wait for a few seconds
sleep 10

# Kill the processes
kill %1
kill %2

# Check the contents of the files (output will be consistent)
cat file1.txt
cat file2.txt