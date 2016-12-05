#!/bin/bash

cd /storage/projects/Scheduler/schedule
while read -r line
do
	echo "notify-send '${line:4}'" | at ${line:0:4} $(date '+%m%d%Y')
done < $(date '+%Y/%m/%d')
