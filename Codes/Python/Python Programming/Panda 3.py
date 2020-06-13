import numpy as np
import pandas as pd

# Panda Merge
file = "E:\SAS SSO Data\Python\Panda\zoo.csv"
zoo = pd.read_csv(file,delimiter=",")
zoo_eat = pd.DataFrame([['elephant','vegetables'], ['tiger','meat'], ['kangaroo','vegetables'],
                       ['zebra','vegetables'], ['giraffe','vegetables']], columns=['animal', 'food'])

print zoo.merge(zoo_eat)
print zoo.merge(zoo_eat, how='left')
print zoo.merge(zoo_eat, how='left', left_on='animal', right_on='animal')
print zoo.merge(zoo_eat, how='left', left_on='animal', right_on='animal').fillna('meat')
print zoo.merge(zoo_eat, how='left', left_on='animal', right_on='animal').fillna('meat')[['animal','food']]

# Panda Sort
print zoo.sort_values(by=['water_need'])
print zoo.sort_values(by=['water_need']).reset_index()
print zoo.sort_values(by=['water_need'], ascending=False).reset_index(drop=True)

