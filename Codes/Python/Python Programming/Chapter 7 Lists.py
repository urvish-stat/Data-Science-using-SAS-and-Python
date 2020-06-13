# Accessing values in Lists
list1 = ['physics', 'chemistry', 1997, 2000]
list2 = [1, 2, 3, 4, 5]
list3 = ['a', 'b', 'c', 'd']
print 'list1[0]: ', list1[0]
print 'list2[1]: ', list2[1]
print 'list2[1:5]: ', list2[1:5]

# Updating Lists
list1[2] = 2001
print list1

# Delete List elements
del list1[2]
print list1

# Built in functions for Lists
print len(list1)
print max(list2)
print min(list2)
atuple = (123, 'C++', 'Java', 'Python')
list1 = list(atuple)
print list1
str = "Hello World"
print list(str)

# Methods for lists
list1 = ['C++', 'Java', 'Python']
list1.append('C#')
print list1
print list1.count('C++')

list1 = ['physics', 'chemistry', 'maths']
list2 = list(range(5))
list1.extend(list2)
print list1

print list1.index('maths')

list1.insert(1, 'Economics')
print list1
list1.pop()
print list1
list1.pop(1)
print list1
list1.remove('maths')
print list1
list1.reverse()
print list1
list1.sort()
print list1



