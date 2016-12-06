# Scheduler

**Description:**  
A calendar/planner application that allows you to track assignments both for classes and for activities and clubs. The application will lets the user add/drop classes, homework assignments, activities, and tasks and prompt them periodically. Additionally, if the user specifies when they have freetime, the app will make suggestions for tasks that should be done. Lastly, the user can put their computer into “study mode”, which will prompt them regularly at certain intervals to make sure they take regular breaks (for water/stretch their legs).

**Project Partners:**  
Aashil Desai and Alec Wang  
University of Pennsylvania | Class of 2019

**Commands**
A few preliminaries:
[date] refers to the date, which should be in the format of [month] [day] [year], with space in between. [year] should be 2 digits, and [month] and [day] can be one or two-digit numbers.

[time] refers to time on a 24 hour clock, and must be a 4-digit number (including leading zeroes).

Here are the following commands:
Tasks:
	"task" pulls up the current list of tasks

	"add task [date] [task]" adds a task with date [date]

Activities:
	"activities [date]" pulls up all the activities at a given day. The flags "-y" and "-t" can be used to mean "yesterday" and "tomorrow" specifically. No date is implied to mean "today".

	"set [date] [time] [activity]" schedules an activity for that date and time.

Misc.
	"quit" quits the app

**Activities vs Tasks**
The big difference between Activities and Tasks is the nature of how users are notified of them. With activities, users are notified as they happen, but with tasks there are no notifications. Additionally, tasks can only be stored in a sorted central file and activities are stored anda ccessed by date. So why?

Tasks are best viewed as one-off assignments that the user plans to work on until a due date. Accordingly, the list of tasks is merely a list of on-going obligations, in order of due date. In contrast, activities are best viewed as commitments that cannot be started until a specified start date, which is appropriate to notify the user of.

So for example, a meeting at 8PM on friday is an activity. Preparing the powerpoint slides for that meeting is a task.

**System Requirements and Push Notification**
Most of the functionality of this app is native to linux. Python with pandas installed is necessary for sorting the tasks and the push notifications are specific to your desktop environment. On KDE, notify-send is the command for sending a push notification, but that will have to be changed depending on your desktop environment.
