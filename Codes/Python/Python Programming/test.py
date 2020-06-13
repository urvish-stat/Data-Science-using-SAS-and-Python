import numpy as np
import pandas as pd
import re

qry = """select * from BUSINESS.@WIRE
select * from BUSINESS.@MI where date > (select date from BUSINESS.@KDD_CAL)
select * from BUSINESS.@ACCT_BAL_POS_SMRY
"""
print qry

qry = qry.split('from')
print qry
fo = open("E:\\SAS SSO Data\\Python\\test.csv", "w")
for items in qry:
    _temp1 = items.split()
    _temp1 = _temp1[0]
    if _temp1.find('@') != -1:
        fo.write(str(_temp1))
        fo.write('\n')
fo.close()

l4_amlscsm_tbl = pd.read_csv("E:\\SAS SSO Data\\Python\\test1.csv",
                             names=["l4_tables"])
scenario_xml_tbl = pd.read_csv("E:\\SAS SSO Data\\Python\\test.csv",
                               delimiter=',',
                               names=["scenario_tables"])
match = scenario_xml_tbl.merge(l4_amlscsm_tbl, how='left',
                               left_on='scenario_tables',
                               right_on='l4_tables').fillna('NOT FOUND')
match = match[match.l4_tables == 'NOT FOUND']
cnt = len(match.index)
fo = open("E:\\SAS SSO Data\\Python\\compare.csv", "w")
if cnt >= 1:
    match.to_csv("E:\\SAS SSO Data\\Python\\compare.csv")
else:
    out_str = "All the tables present in l4_amlscsm"
    fo.write(out_str)
fo.close()
