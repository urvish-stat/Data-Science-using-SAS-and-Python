# Python Time module

import time;

ticks = time.time()
print 'Number of ticks since 01JAN1970 12:00 AM: ', ticks

print time.localtime()

# Get the current time
curr_time = time.asctime(time.localtime())
print 'Current Time: ', curr_time

# Get the calendar of month
import calendar;
cal = calendar.month(2019,2)
print 'Canlendar for 2019 Feb: ', cal

print 'Current Time: ', time.ctime()

# Get the struct_time from seconds
st = time.gmtime(25.100)
print 'Struct Time: ', st

# Make time
t = (2016, 2, 15, 10, 13, 38, 1, 48, 0)
d = time.mktime(t)
print 'Make Time: ', d
print 'Make time in redeable format: ', time.asctime(time.localtime(d))

time_tuple = time.strptime("30 12 2018", "%d %m %y")
print 'Tuple: ', time_tuple

