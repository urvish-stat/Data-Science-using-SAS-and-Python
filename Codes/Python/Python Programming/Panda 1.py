import pandas as pd
import numpy as np
import re

contents = dir(pd)
print contents

# Read the CSV file
zoo = pd.read_csv("E:\SAS SSO Data\Python\Panda\zoo.csv",delimiter = ',')
article_read = pd.read_csv("E:\SAS SSO Data\Python\Panda\pandas_tutorial_read.csv",delimiter = ';',
                                names = ['my_datetime','event','country','user_id','source','topic'])
print article_read

# Read CSV using url
url = "http://46.101.230.157/dilan/pandas_tutorial_read.csv"
column_names = ['my_datetime','event','country','user_id','source','topic']
panda_url_file = pd.read_csv(url,delimiter=';',names = column_names)
print panda_url_file

# Print a sample of Data Frame
print "First Five Lines from Data Frame: \n ", article_read.head()
print "Last Five Lines from Data Frame: \n", article_read.tail()
print "Random Five Lines from Data Frame: \n", article_read.sample(5)

# Select specific columns from Data Frame
print "Column Country and user_id from Data Frame: \n", article_read[['country','user_id']]
print "Column country as a series: \n", article_read.country

# Subset Observations from Data Frame
print "source == 'SEO' \n", article_read[article_read.source == 'SEO']
print "source == 'SEO' \n", article_read.source == 'SEO'

# Nested Functions for Data Frame
print "First Five Observations for country and user_id: \n", article_read.head()[['country', 'user_id']]
print "First Five Observations for country and user_id: \n", article_read[['country', 'user_id']].head()

keep_vars = ["user_id", "country", "topic"]
article_read = article_read[keep_vars][article_read.country == "country_2"].head()
print "Test yourself: \n", article_read

country_trunc = re.sub(r'_.', ' ', str(article_read.country))
print country_trunc