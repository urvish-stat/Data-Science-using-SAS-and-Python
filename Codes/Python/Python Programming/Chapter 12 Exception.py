# Python Exceptions

# Assertion Exception
def kelvintofahrenheit(temp):
    assert (temp >= 0), "Colder than absolute zero!"
    return ((temp-273)*1.8)+32

print kelvintofahrenheit(273)
print kelvintofahrenheit(10)
# kelvintofahrenheit(-5)

# TRY/EXCEPT Block
_rc = 0
try:
    temp_var = 8.90 + 6.45

except ArithmeticError:
    _rc += 1
    print 'ERROR in calculating temp_var'
    print '_rc = :', _rc
else:
    print 'Calculation is done successfully'
    print 'Value of temp_var is: ', temp_var
    print '_rc = :', _rc

# TRY/FINALLY Block
try:
    temp_var = 8.90 + 6.45
finally:
    _rc = 0
    print 'Resetting _rc = :', _rc

# Argument of an Exception
try:
    temp_var = 1/0

except ArithmeticError as arg:
    _rc += 1
    print 'ERROR in calculating temp_var'
    print arg
    print '_rc = :', _rc
else:
    print 'Calculation is done successfully'
    print 'Value of temp_var is: ', temp_var
    print '_rc = :', _rc

# Raise Exceptions
def func_name(level):
    if level < 1:
        raise Exception(level)
    return level

try:
    l = func_name(-10)
    print l
except Exception as test:
    print 'Error in level argument: ', test