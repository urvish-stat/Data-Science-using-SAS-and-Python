** SAS SQL;

** Basics of Select clause;
proc sql;
  select * 
  from sashelp.class;
quit;

** Selecting columns using Select clause;
proc sql;
  select name,sex,age
  from sashelp.class;
quit;
 
** Using SAS Fnctions in Select clause; 
proc sql;
  select upcase(name) as name,sex,round(weight) as weight
  from sashelp.class;
quit;

** Create Table;
proc sql;
  create table want as 
  select *
  from sashelp.shoes;
quit;

** Group by and Order By;
proc sql;
  create table shoes_aggr as 
  select region,subsidiary,sum(sales) as tot_sales
  from sashelp.shoes
  group by 1,subsidiary
  order by 3 desc;
quit;

** Where;
proc sql;
  create table shoes_aggr as 
  select region,subsidiary,sum(sales) as tot_sales, (sales*0.5) as discount
  from sashelp.shoes
  where upcase(region) = "CANADA"
  group by 1,subsidiary
  order by 3 desc;
quit;

** Calculated;
proc sql;
  create table shoes_aggr as 
  select region,subsidiary,product,(sales*0.5) as discount
  from sashelp.shoes
  where calculated discount >= 50000;
quit;

** Having Clause;
proc sql;
  create table shoes_aggr as 
  select region,subsidiary,sum(sales) as tot_sales
  from sashelp.shoes
  group by 1,subsidiary
  having tot_sales >= 2000000
  order by 3 desc;
quit;

** SAS SQL Joins;
data one;
  input name $ age;
  cards;
Name1 30
Name2 40
Name3 50
Name4 60
;
run;

data two;
  input name $ height;
  cards;
Name1 5
Name2 6
Name3 5
Name6 7
;
run;

** Inner Join;
proc sql;
  create table both as 
  select a.*,b.height
  from one as a,two as b
  where a.name = b.name;
quit;

** Left Join;
proc sql;
  create table both as 
  select a.*,b.height
  from one as a left join two as b
  on a.name = b.name;
quit;

** Right Join;
proc sql;
  create table both as 
  select a.*,b.height
  from one as a right join two as b
  on a.name = b.name;
quit;

** Full Join;
proc sql;
  create table both as 
  select a.*,b.height
  from one as a full join two as b
  on strip(a.name) = strip(b.name);
quit;