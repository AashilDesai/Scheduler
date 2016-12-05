#!/bin/bash

IFS=$'\n' task+=( $(head -3 tasks) )

notify-send "Study Mode" "$(echo -e "Tasks:\n ${task[0]}\n ${task[1]}\n ${task[2]}")"
at -f /storage/projects/Scheduler/break.sh now + 25 minutes
