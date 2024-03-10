#!/bin/bash

# Input file path
INPUT_FILE="/Input/access.log"

# Output directory paths
OUTPUT_DIR1="/Outputs/Part_01/sample_log_output"
OUTPUT_DIR2="/Outputs/Part_01/access_log_output"

# Job 1: Top 3 IPs from whole dataset (sample.log)
echo "Job 1: Top 3 IPs from whole dataset (sample.log)"
hadoop jar /$HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-3.3.6.jar -file /home/hadoop/Assignment_01/Part_01/mapper.py -mapper "/usr/bin/python3 /home/hadoop/Assignment_01/Part_01/mapper.py" -file /home/hadoop/Assignment_01/Part_01/reducer1.py -reducer "/usr/bin/python3 /home/hadoop/Assignment_01/Part_01/reducer1.py" -input /Input/sample.log -output "$OUTPUT_DIR1" &

echo "-----------------------------------------------------------------------------------------------------------"

# Job 2: Top 3 IPs from whole dataset (access.log)
echo "Job 2: Top 3 IPs from whole dataset (access.log)"
hadoop jar /$HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-3.3.6.jar -file /home/hadoop/Assignment_01/Part_01/mapper.py -mapper "/usr/bin/python3 /home/hadoop/Assignment_01/Part_01/mapper.py" -file /home/hadoop/Assignment_01/Part_01/reducer1.py -reducer "/usr/bin/python3 /home/hadoop/Assignment_01/Part_01/reducer1.py" -input "$INPUT_FILE" -output "$OUTPUT_DIR2"
