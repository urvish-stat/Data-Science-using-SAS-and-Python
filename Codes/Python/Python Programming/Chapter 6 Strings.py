# Python Strings Function

str = "this is string example...wow!!!"

print 'str.capitalize: ', str.capitalize()
print 'str.center: ', str.center(40, '*')

sub = 'i'
print 'str.count(sub): ', str.count(sub)
print "str.count('exam', 4, 40): ", str.count('exam', 4, 40)

suffix = '!!!'
print 'str.endswith(suffix): ', str.endswith(suffix)
print 'str.endswith(suffix, 40): ', str.endswith(suffix, 40)
print "str.endswith('exam'): ", str.endswith('exam')

str = 'this is \tstring example...wow!!!'
print 'Original String: ' + str
print 'str.expandtabs(): ' + str.expandtabs()
print 'str.expandtabs(16): ' + str.expandtabs(16)

str1 = "this is string example...wow!!!"
str2 = 'exam'
print 'str1.find(str2): ', str1.find(str2)
print 'str1.find(str2, 10): ', str1.find(str2, 10)
print 'str1.find(str2, 40)', str1.find(str2, 40)

print 'str1.index(str2): ', str1.index(str2)
print 'str1.index(str2, 10): ', str1.index(str2, 10)
# print 'str1.index(str2, 40)', str1.index(str2, 40)

str = "abcd23456"
print 'str.isalnum(): ', str.isalnum()
str1 = "abcd 23456"
print 'str1.isalnum(): ', str1.isalnum()

str = "abcd"
print 'str.isalpha(): ', str.isalpha()
str1 = "abcd1234"
print 'str1.isalpha(): ', str.isalpha()

str = "123456"
print 'str.isdigit(): ', str.isdigit()
str1 = "abcd"
print 'str1.isdigit(): ', str1.isdigit()

str = "This is Example String"
print 'str.islower(): ', str.islower()
str1 = "this is example string"
print 'str1.islower(): ', str1.islower()

str = "   "
print 'str.isspace(): ', str.isspace()
str1 = "This is string example"
print 'str1.isspace(): ', str1.isspace()

str = "This is String Example"
print 'str.istitle(): ', str.istitle()
str1 = "THIS IS STRING example"
print 'str1.istitle(): ', str1.istitle()

str = "This is String Example"
print 'str.isupper(): ', str.isupper()
str1 = "THIS IS STRING EXAMPLE"
print 'str1.isupper(): ', str1.isupper()

s = '?'
name = ('Urvish', 'Shah')
print s.join(name)

name = 'Urvish '
print 'Total Length of name is: ', len(name)

str = 'This is string example'
print str.ljust(50, '*')

name = 'URVISH'
print name.lower()

str = 'This is string'
print str.replace('is', 'was')

name = 'Urvish Shah'
print name.rfind('h')

str = 'This is string'
str_list = str.split()
print str_list
str_list = str.split('i', 1)
print str_list

name = 'urvish shah'
print name.swapcase()
print name.title()


