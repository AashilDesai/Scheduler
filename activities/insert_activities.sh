#!/bin/bash

#The point of this script is to insert the activities at a given date

#first thing we do is append it to the file

if [ ! -d "../schedule/${3}" ] #so the year doesn't exist
	then
	mkdir  "../schedule/${3}"
fi

if [ ! -d "../schedule/${3}/${2}" ] #month doesn't exist
	then
	mkdir "../schedule/${3}/${2}"
fi


echo "${4}${5}" >> "../schedule/${3}/${2}/${1}" #append "[time][activity]" to file

#SORT?

echo "Activity \"${5}\" inserted on ${1}/${2}/${3} at ${4:0:2}:${4:2}."
