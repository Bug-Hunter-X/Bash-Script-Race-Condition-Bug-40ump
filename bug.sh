#!/bin/bash

# This script demonstrates a race condition bug.

# Create two files
touch file1.txt
touch file2.txt

# Start two processes simultaneously
(while true; do echo "Process 1: $(date)" >> file1.txt; sleep 1; done) &
(while true; do echo "Process 2: $(date)" >> file2.txt; sleep 1; done) &

# Wait for a few seconds
sleep 10

# Kill the processes
kill %1
kill %2

# Check the contents of the files (will show interleaving output)
cat file1.txt
cat file2.txt