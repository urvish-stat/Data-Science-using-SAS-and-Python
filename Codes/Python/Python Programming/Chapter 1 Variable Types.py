# Assigning Values to Variables
counter = 100    # AN integer assignment
miles = 100.0    # Floating point assignment
name = 'Jhon'    # String assignment

print 'Integer = ', counter
print 'Floating point = ', miles
print 'String = ', name

# Multiple Assignment
a = b = c = d = 1
print a, b, c, d

a, b, c = 1, 2, 'Jhon'
print a, b, c

# Python Numbers
var1 = 10
var2 = 20
print var1, var2

del var1
# print var1

# Python Strings
str = 'Hello World!'
print str           # Prints complete string
print str[0]        # Prints first character of string
print str[2:5]      # Prints characters starting from 3 to 5
print str[3:]       # Prints characters starting from 4 to end
print str * 2       # Prints string for 2 times
print str + "TEST"  # Prints concatenated string

# Python Lists
list = ['abcd', 786, 2.23, 'john', 70.2]
tinylist = [123, 'john']

print list             # Print complete list
print list[0]          # Print first element from list
print list[1:3]        # Print elements from 2nd to 3rd
print list[2:]         # Print element from 3rd to end
print list + tinylist  # Print concatenated lists
print tinylist * 2     # Print tinylist 2 times

# Python Tuples
tuple = ('abcd', 786, 2.23, 'john', 70.2)
tinytuple = (123, 'john')

print tuple              # Print complete tuple
print tuple[0]           # Print first element from tuple
print tuple[1:3]         # Print elements from 2nd to 3rd
print tuple[2:]          # Print elements from 3rd to end
print tuple + tinytuple  # Print concatenated tuples
print tinytuple * 2      # Print tinytuple 2 times

list[2] = 2000   # Valid syntax as we can update list
print list

# tuple[2] = 2000  # Invalid syntax as we can't update tuple

# Python Dictionary
dict = {}
dict['one'] = "This is one"
dict[2] = "This is two"
tinydict = {'name': 'john', 'code': 6734, 'dept': 'sales'}

print dict['one']        # Prints value for one key
print dict[2]            # Prints value for second key
print tinydict           # Prints tinydict
print tinydict.keys()    # Prints tinydict keys
print tinydict.values()  # Prints tinydict values
