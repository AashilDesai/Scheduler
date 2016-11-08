#!/bin/bash

#This is be a very small thing, but it will allow users to add and list classes.

filename="classes.txt"


#first see if the file even exists
if [! -f $filename ]
	then
	>$filename
fi

if [[ $1 == "add" ]] 
	then
	if grep -q $2 "$filename"; then
		echo "Class already exists"
	else
		then
		echo $2 >> $filename
		echo "Class added!"
	fi
elif [[ $1 == "list" ]]
	then
	echo "Classes: "
	cat $filename | echo
else
	then
	echo "Command not recogmized"
	return 1
fi