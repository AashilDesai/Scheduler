#!/bin/bash

echo "${1}${2}${3} $4" >> ../Tasks

#SORT
python sorttasks.py

echo "Task \"${4}\" added, with a date of ${1}/${2}/${3}."
