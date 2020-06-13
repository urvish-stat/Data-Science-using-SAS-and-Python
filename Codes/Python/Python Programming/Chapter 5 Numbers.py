# Python Numerical Functions

print 'abs(-45): ', abs(-45)
print 'abs(100.12): ', abs(100.12)

import math
print 'ceil(-45.17): ', math.ceil(-45.17)
print 'ceil(100.12): ', math.ceil(100.12)
print 'ceil(100.72): ', math.ceil(100.72)

print 'exp(-45.17): ', math.exp(-45.17)
print 'exp(100.12): ', math.exp(100.12)
print 'exp(100.72): ', math.exp(100.72)

print 'floor(-45.17): ', math.floor(-45.17)
print 'floor(100.12): ', math.floor(100.12)
print 'floor(100.72): ', math.floor(100.72)

print 'log(-45.17): ', math.log(45.17)
print 'log(100.12): ', math.log(100.12)
print 'log(100.72): ', math.log(100.72)

print 'max(80, 100, 120): ', max(80, 100, 120)
print 'max(-20, 40, 100): ', max(-20, 40, 100)
print 'max(-10, -5, -10.20): ', max(-10, -5, -10.20)

print 'min(80, 100, 120): ', min(80, 100, 120)
print 'min(-20, 40, 100): ', min(-20, 40, 100)
print 'min(-10, -5, -10.20): ', min(-10, -5, -10.20)

print 'modf(100.12): ', math.modf(100.12)
print 'modf(100.72): ', math.modf(100.72)
print 'modf(-45.12): ', math.modf(-45.12)

print 'pow(100,2): ', math.pow(100,2)
print 'pow(5,4): ', math.pow(5,4)
print 'pow(-10,2): ', math.pow(-10,2)

print 'round(70.23456): ', round(70.23456)
print 'round(56.659,1): ', round(56.659,1)
print 'round(80.264,2): ', round(80.264,2)

print 'sqrt(100): ', math.sqrt(100)
print 'sqrt(7): ', math.sqrt(7)

# Random Number Functions

import random
print 'Random Number from list 1: ', random.choice(range(100))
print 'Random Number from list 2: ', random.choice([1, 15, 50, 100])
print 'Random Word from string: ', random.choice('Hello Python')

print 'Randomly select an odd number: ', random.randrange(1, 100, 2)
print 'Randomly select number between 0-99: ', random.randrange(100)

print 'First Random number: ', random.random()
print 'Second Random number: ', random.random()

random.seed()
print 'Random NUmber with default seed: ', random.random()
random.seed(10)
print 'Random number with changed seed: ', random.random()

list = [20, 16, 10, 5]
random.shuffle(list)
print 'Reshuffled the items in list: ', list

# Creating sample numbers of sample size 10 between 0-100
random.seed(10)
sample_size = 0
n_sample = []
while sample_size < 10:
    _temp1 = round(random.random() * 100)
    n_sample.append(_temp1)
    sample_size += 1
print n_sample







