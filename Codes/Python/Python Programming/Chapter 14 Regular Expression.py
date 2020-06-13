# Search for the specific comments
text_to_search = """select *
from wire
where orig_acct_fl = 'Y'
/* This is my comment line 1
This is my comment line 2
This is my comment line 3
This is my comment line 4
This is my comment line 5
*/
select *
from mi
where orig_acct_fl = 'Y'
/* This is my comment line 1
This is my comment line 2
This is my comment line 3
This is my comment line 4
This is my comment line 5
*/
"""

import re
str_to_remove = []
pattern = re.compile(r'/\*|\*/')
matches = pattern.finditer(text_to_search)
for match in matches:
    print match.start()
    str_to_remove.append(match.start())
print str_to_remove

text_to_search = """<XML Line 1>
     <XML Line 2>
     <XML Line 3>
     <XML Line 4>
<XML Line 5>
select *
from wire
where date <= 01JAN2019
"""
str_list = text_to_search.splitlines()
print str_list
for items in str_list:
    items = str(items.strip())
    items = str(items.upper())
    test = items.startswith('<')
    if not items.startswith('<'):
        print items