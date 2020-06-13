import numpy as np
import pandas as pd

df = pd.DataFrame(np.random.randn(5,3), columns=['col1','col2','col3'])
print df

# rnge = lambda x: x.sum()

# df1 = df.apply(rnge, axis = 0)
# print df1

df.col1 = np.where(df.col1 < 0, 0, df.col1)
print df
df = df.drop('col1',axis = 1)
print df