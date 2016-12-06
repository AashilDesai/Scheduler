#!/bin/bash

# Pull top three tasks if tasks file exists
if [ ! -f "../Tasks" ]
	then
	echo "No tasks!"
else
    IFS=$'\n' task+=( $(head -3 ../Tasks) )
fi

notify-send "Study Mode" "$(echo -e "Tasks:\n ${task[0]}\n ${task[1]}\n ${task[2]}")" # Send PUsh Notification with top three tasks to complete
at -f "break.sh" now + 25 minutes 2> err # Schedule a break 25 minutes from now
