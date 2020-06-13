# Python Modules

import math
if __name__ == "__main__":
    print 'Successfully imported MATH module'
else:
    print 'Error in importing MATH module'

# Scoping
money = 2000
def addmoney():
    global money # Declared money as a global as it can not be used inside the function
    money += 1
    return money

print money
addmoney()
print money

# Get the Attributed/Functions from modules
content = dir(math)
print content
print __doc__

# Get the Global and Local variables
print globals()
print locals()





