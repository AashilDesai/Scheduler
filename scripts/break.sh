#!/bin/bash

notify-send "Take a Break!" # Push notification to take a break
at -f studymode.sh now + 5 minutes 2> err # Schedule study mode in 5 minutes
