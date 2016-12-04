#!/bin/bash

# the user will be able to (1) ask for the tasks for today, (2) store a task on a day, 
#(3) remove a task for a day, (4) put in study mode, (5) enable desktop notifications, (6) ask for what to do now

#the following commands will work:
#task [date]
#tasks [date]
#get [date]
#instead of "[date]", "today", "yesterday", and "tomorrow" will be acceptable (as well as "t" "y" and blank 
	#(for "tomorrow", "yesterday" and "today" respectiley))


#For storing a task on a day:
#set [date] [time] [task]
	#date formats: "t", "tomorrow", "today", Month/Day/Year (day can be 2 digits or 1, month same, year 2 or 4)
	#time can be 24 hour or 12-our (followed by pm or am (caps irrelevant))
	#if no date, assumed for today
	#if invalid time or task is blank, will throw error

#for removing, same except "remove [date] [time] [task]"

#for studymode, "study", "studymode" and "study" will all work

#for desktop notification, "desktop on", "desktop off", and "desktop" all work (last toggles)

#for ask what to do "tasks", workds (defaults to [tasks today])

