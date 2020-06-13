# Accessing values from Dictionary
dict = {'name': 'zara', 'age': 7, 'class': 'First'}
print "dict(name): ", dict["name"]
print "dict(age): ", dict["age"]

# Updating Dictionary
print 'Old Dict: ', dict
dict['class'] = 8
print 'New Dict: ', dict
dict['school'] = "DPS School"
print 'Added new entry into Dict: ', dict['school']

# Delete dictionary elements
del dict['school']
print dict
dict.clear()
print "Dict Elements: ", dict
del dict
print dict

# Dictionary Methods
dict1 = {'name': 'zara', 'age': 7, 'class': 'First'}
dict2 = dict1.copy()
print 'Dict2: ', dict2

seq = ('name', 'age', 'sex')
dict3 = dict.fromkeys(seq)
print 'Dict3: ', dict3
dict3 = dict.fromkeys(seq,10)
print 'Dict3: ', dict3

dict4 = {'name': 'zara', 'age': 7, 'class': 'First'}
print dict4.get('name')
print dict4.get('age')
print dict4.get('school', 'NA')

print 'Dictionary Items: ', dict4.items()
print 'Dictionary Keys: ', dict4.keys()

dict5 = {'name': 'zara', 'age': 7, 'class': 'First'}
print dict5.setdefault('name')
print dict5.setdefault('age')
print dict5.setdefault('school', 'DPS School')

dict6 = {'name': 'zara', 'age': 7, 'class': 'First'}
dict7 = {'school': 'DPS School'}
dict6.update(dict7)
print dict6

print 'Dictionary Values: ', list(dict6.values())


list = ['name1', 'urvish', 'name2', 'nidhi', 'name3', 'pratik']
print list
dict_test = {}

key_cnt = 0

for keys in list:
    key_cnt += 1
    if key_cnt % 2 != 0:
        print key_cnt
        print keys
        dict_test.setdefault(keys, list[key_cnt])
        print dict_test




