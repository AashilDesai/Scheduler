#!/bin/bash

cd /storage/projects/Scheduler/schedule

# Loop through the activities for the current day and setup push notifications for them
if [ ! -f $(date '+%Y/%m/%d') ]
	then
	echo "No activities for today!"
else
    while read -r line
    do
    	echo "notify-send '${line:4}'" | at ${line:0:4} $(date '+%m%d%Y') 2> err
    done < $(date '+%Y/%m/%d')
fi
