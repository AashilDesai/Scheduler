#!/bin/bash

notify-send "Take a Break!"
at -f studymode.sh now + 5 minutes 2> err
