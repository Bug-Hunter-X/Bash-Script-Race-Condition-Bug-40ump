# Shell Script Race Condition

This repository demonstrates a race condition bug in a simple bash script.  Two processes concurrently write to separate files.  Due to the unpredictable nature of process scheduling, the output in the files will be interleaved and not in a consistent order. This showcases a common concurrency issue in shell scripting.

## Bug Description
The `bug.sh` script creates two processes that simultaneously write timestamps to different files. The resulting output is not deterministic due to the race condition. 

## Solution
The `bugSolution.sh` demonstrates how to mitigate this by using appropriate locking mechanisms (file locks) to ensure exclusive access to the files, thereby avoiding race conditions and guaranteeing consistent output.