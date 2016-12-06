#!/bin/bash

if [ ! -f "../Tasks" ]
	then
	echo "No tasks!"
else

	echo "Here are your current tasks:"

	cat "../Tasks" | while read line
		do
			month=${line:0:2}
			day=${line:2:2}
			year=${line:4:2}
			activity=${line:7}
			echo "${month}/${day}/${year} $activity"
		done
fi