# IF Statement (Non-Zero value)
var1 = 100
if var1:
    print '1 - Got true expression value'
    print var1

# IF Statement (Zero value)
var2 = 0
if var2:
    print '2 - Got true expression value'
    print var2

# IF/ELSE Statements
amount = int(input('Enter Amount: '))
if amount < 1000:
    discount = amount*0.5
    print 'Discount',discount
else:
    discount = amount*0.10
    print 'Discount',discount

print 'Net Payable', amount-discount

# ELIF Statement
amount = int(input('Enter Amount: '))
if amount < 1000:
    discount = amount*0.5
    print 'Discount', discount
elif amount < 5000:
    discount = amount*0.10
    print 'Discount',discount
else:
    discount = amount*0.15
    print 'Discount',discount

print 'Net Payable', amount-discount

# Nested IF Statements
num = int(input('Enter Number: '))
if num % 2 == 0:
    if num % 3 == 0:
        print 'Divisible by 2 and 3'
    else:
        print 'Divisible by 2 not by 3'
else:
    if num % 3 == 0:
        print 'Divisible by 3 not by 2'
    else:
        print 'Not divisible by 2 and not divisible by 3'

