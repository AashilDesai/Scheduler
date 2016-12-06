#!/bin/bash

#The point of this script is to print out the activities at a given date

failureMessage="No activities scheduled for ${1}/${2}/${3}!"

filename="../schedule/${3}/${2}/${1}"

if [ ! -d "../schedule/${3}" ] #so the year doesn't exist
	then
	echo $failureMessage
elif [ ! -d "../schedule/${3}/${2}" ] #so month doesn't exist
	then
	echo $failureMessage
elif [ ! -f "../schedule/${3}/${2}/${1}" ]  #assuming format is just "day number"
	then
	echo $failureMessage
else
	echo "Tasks for ${1}/${2}/${3}:"
	cat $filename | while read line
	do
		hour=${line:0:2}
		minute=${line:2:2}
		task=${line:4}
		echo "${hour}:${minute} $task"
	done
	#statements
fi
