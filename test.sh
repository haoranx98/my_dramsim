#!/bin/bash

# 检查是否有足够的命令行参数
if [ "$#" -ne 2 ]; then
    echo "Usage: $0 <clock_cycles> <trace_file>"
    exit 1
fi

# 分别将命令行参数赋值给变量
clock_cycles=$1
trace_file=$2

# 输出参数以确认
echo "Running simulation with the following parameters:"
echo "Clock cycles: $clock_cycles"
echo "Trace file: $trace_file"

./build/dramsim3main configs/Sumsung_8Gb_x8_2666.ini -c $clock_cycles -t $trace_file > a.txt
cat a.txt | grep READ > r.txt
cat a.txt | grep WRITE > w.txt
awk '{sum += $3} END {print "Average =", sum / NR}' w.txt
awk '{sum += $3} END {print "Average =", sum / NR}' r.txt
