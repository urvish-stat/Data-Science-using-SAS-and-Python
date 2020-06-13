# Python Functions

def printme(str):
    "This prints a passed string into this function"
    print str
    return

printme('This is first call')
printme('This is second call')

# Pass by reference vs. value
def changeme(mylist):
    "This changes passed list into this function"
    print 'Values inside the function before change: ', mylist
    mylist[2] = 50
    print'values inside the function after change: ', mylist
    return

temp_list = [10, 20, 30]
changeme(temp_list)
print'Values outside the function: ', temp_list

def changeme(mylist):
    "This changes passed list into this function"
    print 'Values inside the function before change: ', mylist
    mylist = [1, 2, 3]
    print'values inside the function after change: ', mylist
    return

temp_list = [10, 20, 30]
changeme(temp_list)
print'Values outside the function: ', temp_list

# Default Arguments
def printinfo(name, age = 35):
    print 'Name: ', name
    print 'Age: ', age
    return

printinfo(age = 28, name = 'Urvish')
printinfo('Urvish', age = 28)

# Variable-length Arguments
def printinfo(arg1, *vartuple):
    print 'Output is: ', arg1
    for items in vartuple:
        print items
    return

printinfo(10)
printinfo(30, 40, 50)

# Anonymous Functions
sum = lambda arg1, arg2: arg1 + arg2
_temp1 = sum(5,17)
print _temp1

# Return Statement
def sum(arg1, arg2):
    total = arg1 + arg2
    return total
_temp2 = sum(4, 16)
print _temp2

total = 0 # Outside the function call

def sum(arg1, arg2):
    total = arg1 + arg2
    print 'Inside the function: ', total
    return total
sum(85, 63)
print 'Outside the function: ', total

