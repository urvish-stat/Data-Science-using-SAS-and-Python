# WHILE Loop
count = 0
while count < 9:
    print 'The Count is: ', count
    count += 1

count = 0;
while count < 5:
    print 'The count is: ', count
    count += 1
else:
    print count, 'is not less than 5'

# FOR Loop
for var in list(range(5)):
    print var

for letter in 'Python': # Iterate on string
    print 'Current Letter is: ',letter

fruits = ['banana','apple','mango'] # Iterate on List Sequence
for fruit in fruits:
    print 'Current Fruit is: ',fruit

# Iterating by Sequence Index
fruits = ['banana', 'apple', 'mango']
for index in range(len(fruits)):
    print 'Current fruit is: ', fruits[index]

numbers = [11,33,55,39,55,75,37,21,23,41,13]
for num in numbers:
    if num % 2 == 0:
        print 'The list contains even numbers'
else:
    print 'The list does not contain even numbers'

# Nested FOR Loops
for i in range(1,11):
    for j in range(1,11):
        k = i * j
        print k

# BREAK statement in loop
for letter in 'Python':
    if letter == 'h':
        break
    print 'Current Letter: ', letter

var = 10
while var > 0:
    print 'Current Variable Value: ', var
    var -= 1
    if var == 5:
        break

no = int(input('Any Number: '))
numbers = [11,33,55,39,55,75,37,21,23,41,13]
for num in numbers:
    if num == no:
        print 'Number found in list'
        break
else:
    print 'Number does not found in list'

# CONTINUE Statement in loop
for letter in 'Python':
    if letter == 'h':
        continue
    print 'Current letter is: ', letter

var = 10
while var > 0:
    var -= 1
    if var == 5:
        continue
    print 'Current value is: ', var

# PASS Statement in loop
for letter in 'Python':
    if letter == 'h':
        pass
        print 'This is pass block'
    print 'Current Letter: ', letter




