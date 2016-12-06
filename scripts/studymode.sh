#!/bin/bash

if [ ! -f "../Tasks" ]
	then
	echo "No tasks!"
else
    IFS=$'\n' task+=( $(head -3 ../Tasks) )
fi

notify-send "Study Mode" "$(echo -e "Tasks:\n ${task[0]}\n ${task[1]}\n ${task[2]}")"
at -f "break.sh" now + 25 minutes 2> err
