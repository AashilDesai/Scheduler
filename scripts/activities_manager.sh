#!/bin/bash

# the user will be able to (1) ask for the activities for today, (2) store a task on a day,
#(3) remove a task for a day, (4) put in study mode, (5) enable desktop notifications, (6) ask for what to do now

#the following commands will work:
#task [date]
#activities [date]
#get [date]
#instead of "[date]", "today", "yesterday", and "tomorrow" will be acceptable (as well as "t" "y" and blank
	#(for "tomorrow", "yesterday" and "today" respectiley))


#For storing a task on a day:
#set [date] [time] [task]
	#date formats: "t", "tomorrow", "today", Month Day Year (day is 2 digits, month is two digits, year is two digits)
	#time will be 24 hours
	#if words "today", "tomorrow", "yesterday"
	#if invalid time or task is blank, will throw error

#for removing, same except "remove [date] [time] [task]"

#for studymode, "study", "studymode" and "study" will all work, end studymode

#for ask what to do "activities", workds (defaults to [activities today])


#Helper function which sees if a date is correct (0) or not (anything else)
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

#Helper function that sees if time is proper 24 hour (0),  or wrong (anyhting else)
valid_time ()
{
	if [[ $# -ne 1 ]]
	then
		echo 1
	elif ! [[ "$1" =~ ^-?[0-9]+$ ]]
	then
		echo 2
	elif ( [[ $1 -lt 0 ]] || [[ $1 -gt 2359 ]] )
	then
		echo 3
	elif [[ ${1:2:1} -gt 5 ]]
	then
		echo 4
	else
		echo 0
	fi
}


parse_input ()
{
	if( [[ $1 == "activity" ]] || [[ $1 == "activities" ]] )
	then
		#they're asking for the activities on a day
		if( [[ $2 == "today" ]] || [[ $# -eq 1 ]] )
			then
			month=`date +%m`
			day=`date +%d`
			year=`date +%y`

			if [[ $month -lt 10 ]]
				then
				month="0${month}"
			fi

			if [[ $day -lt 10 ]]
				then
				day="0${day}"
			fi

			bash read_activities.sh $month $day $year
		elif ( [[ $# -gt 5 ]] )
			then
			echo 'Unrecognized command. Must enter "[activity/activities] [date]"'
		elif ( [[ $2 == "tomorrow" ]] || [[ $2 == "-t" ]] )
			then
			#get tomorrow's activities
			month=`date +%m`
			day=`date +%d`
			year=`date +%y`

			day=$((day+1))

			if [[ $month -lt 10 ]]
				then
				month="0${month}"
			fi

			if [[ $day -lt 10 ]]
				then
				day="0${day}"
			fi

			bash read_activities.sh $month $day $year
		elif ( [[ $2 == "yesterday" ]] || [[ $2 == "-y" ]] )
			then
			#get yesterday activities
			month=`date +%m`
			day=`date +%d`
			year=`date +%y`

			day=$((day-1))

			if [[ $month -lt 10 ]]
				then
				month="0${month}"
			fi

			if [[ $day -lt 10 ]]
				then
				day="0${day}"
			fi

			bash read_activities.sh $month $day $year
		else
			#now it's a date, so we have to parse it
			entered_date=$(valid_date $2 $3 $4)
			if [[ $entered_date -eq 0 ]]
				then

				echo "Valid date entered"

				bash read_activities.sh $2 $3 $4
			else
				echo "That's an invalid date: ${entered_date}"
			fi
		fi
	elif ( [[ $1 == "set" ]] )
		then
		#so now we need to set the date
			entered_date=$(valid_date $2 $3 $4)
			if [[ $entered_date -eq 0 ]]
				then
				entered_time=$(valid_time $5)

				if [[ $entered_time -eq 0 ]]
					then

					bash insert_activities.sh $2 $3 $4 $5 "$6"
				else
					echo "Invalid time!"
				fi
			else
				echo "That's an invalid date: ${entered_date}"
			fi
	elif ( ( [[ $1 == "task" ]] || [[ $1 == "tasks" ]] ) && [[ $# -eq 1 ]] )
		then
		#so now we need to set the date
		bash read_tasks.sh
	elif ( [[ $1 == "add" ]]  && ( [[ $2 == "task" ]] || [[ $2 == "tasks" ]] ) )
		then
		bash add_task.sh $3 $4 $5 "$6"
    elif ( [[ $1 == "study" ]] || [[ $1 == "studymode" ]])
        then
        if ( [[ $2 == "-q" ]] )
            then
            atrm $(atq | cut -f1)
            bash notifier.sh
        else
            bash studymode.sh
        fi
	else
		echo "Invalid command!"
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
