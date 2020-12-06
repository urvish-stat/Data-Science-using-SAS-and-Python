** SAS Character Functions;
data want;
  set sashelp.shoes;
  region_upcase = upcase(region);
  region_lowcase = lowcase(region);
  region_strip = strip("This is Test String   ");
/*   if lowcase(region) = "AFRICA"; */
run;

data want;
  str = "This?is test string    ";
  strip = strip(str);
  compress = compress(str);
  scan = scan(str,1," ?");
  index = index(str,"test");
  substr = strip(upcase(substr(str,1,4)));
  length = length(substr);
run;

** SAS Numeric Functions;
data want;
  min = min(100,1000,10000);
  max = max(100,1000,10000);
  abs = abs(-120.20);
  ceil = ceil(100.20);
  floor = floor(100.20);
  round = round(100.2);  
run;

** Appending;
1st SAS Dataset
1
2
3

2nd SAS Dataset
4
5
6

3rd SAS Dataset
1
2
3
4
5
6

data one;
  input name $ age;
  height = 5;
  cards;
Name1 20
Name2 30
Name3 40
;
run;

data two;
  input name $12. age;
  cards;
Name5 Name5 20
Name6 Name6 30
Name7 Name7 40
;
run;

data both;
  set one two;
run;

proc append base = one data = two force;  
run;

1. pos_sales
proc append base = total_sales data = iter1_sales
cat_sales
sub_cat_sales

** Merging;
1st SAS Dataset
key var1
key1 value1
key2 value2
key3 value3

2nd SAS Dataset
key  var2
key1 value11
key2 value22
key3 value33

3rd SAS Dataset
key1 value1 value11
key2 value2 value22
key3 value3 value33

data one;
  input name $ age;
  cards;
Name3 20
Name1 30
Name2 40
Name4 50
;
run;

data two;
  input name $ height;
  cards;
Name6 4
Name3 5
Name1 6
Name4 5
;
run;


proc sort data = one;
 by name;
run;

proc sort data = two;
 by name;
run;

data both(drop = i);
  merge one two;  
  by name;
  array num_vars {*} _NUMERIC_;  
  do i = 1 to dim(num_vars);
    if missing(num_vars{i}) then num_vars{i} = 0;
  end;
run;

** Proc Means;
proc means data = sashelp.shoes nway mean median std stderr clm;
  class region product;
  var sales;
  output out = shoes_desc_stat mean = mean median = median std = std stderr = stderr;
run;

** Proc Univarite;
ods trace on;
ods select BasicMeasures;
proc univariate data = sashelp.shoes;
  var sales;
run;
ods trace off;

** Proc Freq;
proc freq data = sashelp.shoes order = freq;
  tables region;
  tables region * product / nocol nopercent;
run;



