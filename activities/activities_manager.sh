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
	#date formats: "t", "tomorrow", "today", Month Day Year (day can be 2 digits or 1, month same, year 2 or 4)
	#time can be 24 hour or 12-our (followed by pm or am (caps irrelevant))
	#if no date, assumed for today
	#if invalid time or task is blank, will throw error

#for removing, same except "remove [date] [time] [task]"

#for studymode, "study", "studymode" and "study" will all work, end studymode

#for desktop notification, "desktop on", "desktop off", and "desktop" all work (last toggles)

#for ask what to do "tasks", workds (defaults to [tasks today])


#Helper function which sees if a date is correct
valid_date ()
{
	if ( [[ $# -ne 3 ]] )
	then
		echo 1
	elif ! [[ "$1" =~ ^-?[0-9]+$ ]] 
	then
		#it's not a number, so 
		echo 2
	elif ! [[ "$2" =~ ^-?[0-9]+$ ]]
	then
		#it's not a number, so 
		echo 3
	elif ! [[ "$3" =~ ^-?[0-9]+$ ]]
	then
		#it's not a number, so 
		echo 4
	elif ( [[ $1 -lt 0 ]] || [[ $1 -gt 12 ]] ) #month
	then
		echo 5
	elif ( [[ $2 -lt 0 ]] || [[ $2 -gt 31 ]] ) #day
	then
		echo 6
	elif ( [[ $3 -lt 0 ]] || [[ $3 -gt 99 ]] ) #year
	then
		echo 6
	else
		echo 0
	fi
}


parse_input ()
{
	if( [[ $1 == "task" ]] || [[ $1 == "tasks" ]] )
	then
		#they're asking for the tasks on a day
		if( [[ $2 == "today" ]] || [[ $# -eq 1 ]] )
			then
			month=`date +%m`
			day=`date +%d`
			year=`date +%y`

			bash tasks.sh $month $day $year
		elif ( [[ $# -gt 5 ]] )
			then
			echo 'Unrecognized command. Must enter "[task/tasks] [date]"'
		elif ( [[ $2 == "tomorrow" ]] || [[ $2 == "t" ]] )
			then
			#get tomorrow's tasks
			month=`date +%m`
			day=`date +%d`
			year=`date +%y`

			day=$((day+1))

			bash tasks.sh $month $day $year
		elif ( [[ $2 == "yesterday" ]] || [[ $2 == "y" ]] )
			then
			#get yesterday tasks
			month=`date +%m`
			day=`date +%d`
			year=`date +%y`

			day=$((day-1))

			bash tasks.sh $month $day $year
		else
			#now it's a date, so we have to parse it
			blah=$(valid_date $2 $3 $4)
			if [[ $blah -eq 0 ]]
				then
				bash tasks.sh $2 $3 $4
			else
				echo "That's an invalid date"
			fi
		fi
	fi
}

end_loop=false

#Now the program in full begins:

echo 'Welcome to Scheduler!'

while [[ "$end_loop" = false ]] 
do
	echo 'Enter a command:'
	read instruction args

	if( [[ $instruction == "quit" ]] )
		then
		end_loop=true
	else
		parse_input $instruction $args
	fi
done
