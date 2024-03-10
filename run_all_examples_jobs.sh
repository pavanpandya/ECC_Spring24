#!/bin/bash

# Input file path
INPUT_FILE="/Input/access.log"

# Output directory paths
OUTPUT_DIR1="/Outputs/Part_02/Grep"
OUTPUT_DIR2="/Outputs/Part_02/Sort"
OUTPUT_DIR3="/Outputs/Part_02/Wordcount"

# Job 1: Grep
# Ask the user for word to search
read -p "Enter word or pattern you want to search: " pattern
hadoop jar /$HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-3.3.6.jar -file /home/hadoop/Assignment_01/Part_02/Examples/Grep/mapper.py -mapper "/usr/bin/python3 /home/hadoop/Assignment_01/Part_02/Examples/Grep/mapper.py $word" -file /home/hadoop/Assignment_01/Part_02/Examples/Grep/reducer.py -reducer "/usr/bin/python3 /home/hadoop/Assignment_01/Part_02/Examples/Grep/reducer.py" -input /Input/access.log -output "$OUTPUT_DIR1" &

echo "-----------------------------------------------------------------------------------------------------------"

# Job 2: Sort
hadoop jar /$HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-3.3.6.jar -file /home/hadoop/Assignment_01/Part_02/Examples/Sort/mapper.py -mapper "/usr/bin/python3 /home/hadoop/Assignment_01/Part_02/Examples/Sort/mapper.py" -file /home/hadoop/Assignment_01/Part_02/Examples/Sort/reducer.py -reducer "/usr/bin/python3 /home/hadoop/Assignment_01/Part_02/Examples/Sort/reducer.py" -input /Input/access.log -output "$OUTPUT_DIR2" &

echo "-----------------------------------------------------------------------------------------------------------"

# Job 3: Word Count
hadoop jar /$HADOOP_HOME/share/hadoop/tools/lib/hadoop-streaming-3.3.6.jar -file /home/hadoop/Assignment_01/Part_02/Examples/Wordcount/mapper.py -mapper "/usr/bin/python3 /home/hadoop/Assignment_01/Part_02/Examples/Wordcount/mapper.py" -file /home/hadoop/Assignment_01/Part_02/Examples/Wordcount/reducer.py -reducer "/usr/bin/python3 /home/hadoop/Assignment_01/Part_02/Examples/Wordcount/reducer.py" -input /Input/access.log -output "$OUTPUT_DIR3" &

wait
