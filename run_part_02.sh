#!/bin/bash

# Input file path
INPUT_FILE="/Input/access.log"

# Output directory paths
OUTPUT_DIR1="/Outputs/Part_02"

# Job 1: Top 3 IPs between specific duration
# Ask the user for start and end times
read -p "Enter the start time (format HH): " start_time
read -p "Enter the end time (format HH): " end_time

hadoop jar /$HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-3.3.6.jar -file /home/hadoop/Assignment_01/Part_02/mapper.py -mapper "/usr/bin/python3 /home/hadoop/Assignment_01/Part_02/mapper.py" -file /home/hadoop/Assignment_01/Part_02/reducer.py -reducer "/usr/bin/python3 /home/hadoop/Assignment_01/Part_02/reducer.py $start_time-$end_time" -input /Input/access.log -output "$OUTPUT_DIR1"
