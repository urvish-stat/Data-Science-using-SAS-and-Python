# Python Arithmetic Operators
a = 20
b = 10
c = 0

c = a + b
print 'Line 1 - Value of c is ', c

c = a - b
print 'Line 2 - Value of c is ', c

c = a * b
print 'Line 3 - Value of c is ', c

c = a/b
print 'Line 4 - Value of c is ', c

c = a % b
print 'Line 5 - Value of c is ', c

a = 2
b = 3
c = a**b
print 'Line 6 - Value of c is ', c

# Python Comparison Operators
a = 20
b = 10
if a == b:
    print 'Line 1 - a is equal to b'
else:
    print 'Line 1 - a is not equal to b'

if a != b:
    print 'Line 2 - a is not equal to b'
else:
    print 'Line 2 - a is equal to b'

if a < b:
    print 'Line 3 - a is less than b'
else:
    print 'Line 3 - a is not less than b'

if a > b:
    print 'Line 4 - a is greater than b'
else:
    print 'Line 4 - a is not greater than b'

if a >= b:
    print 'Line 5 - a is greater than equal to b'
else:
    print 'Line 5 - a is not greater than equal b'

if a <= b:
    print 'Line 6 - a is less than equal to b'
else:
    print 'Line 6 - a is not less than equal to b'

# Python Assignment Operators
a = 21
b = 10
c = 0

c = a + b
c += b
print 'Line 1 - Value of c is ', c

c *= a
print 'Line 2 - Value of c is ', c

c /= a
print 'Line 3 - Value of c is ', c

c = 2
c %= a
print 'Line 4 - Value of c is ', c

c **= a
print 'Line 5 - Value of c is ', c

# Python Bitwise Operators
a = 60
b = 13
print 'a = ', a, ':', bin(a), 'b = ', b, ':', bin(b)

c = a&b
print 'Result of a&b is ', c, ':', bin(c)

c = a|b
print 'Result of a|b is ', c, ':', bin(c)

# Python Membership Operators
a = 10
b = 20
list = range(1,6)

if a in list:
    print 'Line 1 - Value of a is available in list'
else:
    print 'Line 1 - Value of a is not available in list'

if b not in list:
    print 'Line 2 - Value of b is not in list'
else:
    print 'Line 2 - Value of b is in list'

c = b/a
if c in list:
    print 'Line 3 - Value of c is in list'
else:
    print 'Line 3 - Value of c is not in list'

# Python Identity Operators
a = 20
b = 20

if a is b:
    print 'Line 1 - a and b are having same identity'
else:
    print 'Line 1 - a and b are not having same identity'

if id(a) == id(b):
    print 'Line 2 - a and b have same identity'
else:
    print 'Line 2 - a and b do not have same identity'

if a is not b:
    print 'Line 3 - a and b do not have same identity'
else:
    print 'Line 3 - a and b have same identity'