import pandas as pd
import numpy as np
import re

# Read the CSV file
zoo = pd.read_csv("E:\SAS SSO Data\Python\Panda\zoo.csv",delimiter = ',')

# Panda Aggregation .count()
print "zoo.count() \n", zoo.count()
print "zoo[['animal']].count() \n", zoo[['animal']].count()
print "zoo.animal.count() \n", zoo.animal.count()

# Panda Aggregation .sum()
print "zoo.sum() \n", zoo.sum()
print "zoo[['water_need']].sum() \n", zoo[['water_need']].sum()
print "zoo.water_need.sum() \n", zoo.water_need.sum()

# Panda Aggregation .min()
print "zoo.min() \n", zoo.min()
print "zoo[['water_need']].min() \n", zoo[['water_need']].min()
print "zoo.water_need.min() \n", zoo.water_need.min()

# Panda Aggregation .max()
print "zoo.max() \n", zoo.max()
print "zoo[['water_need']].max() \n", zoo[['water_need']].max()
print "zoo.water_need.max() \n", zoo.water_need.max()

# Panda Aggregation .mean()
print "zoo.mean() \n", zoo.mean()
print "zoo[['water_need']].mean() \n", zoo[['water_need']].mean()
print "zoo.water_need.mean() \n", zoo.water_need.mean()

# Panda Aggregation .median()
print "zoo.median() \n", zoo.median()
print "zoo[['water_need']].median() \n", zoo[['water_need']].median()
print "zoo.water_need.median() \n", zoo.water_need.median()

# Panda Aggregation .groupby
print "zoo.groupby('animal').mean() \n", zoo.groupby('animal').mean()
print "zoo.groupby('animal').mean()[['water_need']] \n", zoo.groupby('animal').mean()[['water_need']]
print "zoo.groupby('animal').mean().water_need \n", zoo.groupby('animal').mean().water_need

# Test Yourself
article_read = pd.read_csv("E:\SAS SSO Data\Python\Panda\pandas_tutorial_read.csv",delimiter = ';',
                                names = ['my_datetime','event','country','user_id','source','topic'])
print "Most frequent source: \n", article_read.groupby('source').count().user_id
print "Frequent topic and source for country_2 \n", article_read[article_read.country == "country_2"].groupby(['topic','source']).count().user_id
