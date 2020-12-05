data have;
  set sashelp.class;
run;

proc print;
run;

libname data "/folders/myfolders";

data data.have;
  set sashelp.class;
run;

data have;
  informat num comma10.;
  format num dollar10.2;
  input num;
  label num = numeric_var;
  cards;
100,000
;
run;

data have;
  a = .; output;
  a = 1; output;
run;

proc contents data = data.have out = have_desc(keep = name) nodetails;
run;

data dates;
  format curr_date two_dys_dt date9.;
  curr_date = today();
  two_dys_dt = curr_date + 2;
run;

options yearcutoff = 1950;
data year_cutoff;
  format year date9.;
  year = "29NOV20"d;
run;

proc print data = sashelp.class(firstobs = 1 obs = 5) noobs;
run;

proc print data = sashelp.class;
run;

options firstobs = 1 obs = 5;

data have;
  set sashelp.shoes;
  if sales <= 10000 then discount = 0.1;
  else if sales >= 15000 and sales <= 50000 then discount = 0.2;
  else discount = 0.5;
run;

data want;
  set sashelp.shoes;
  if sales >= 50000 then do;
    discount = 0.5;
    net_sales = sales * discount;
  end;
  
  else do;
    discount = 0;
    net_sales = sales;
  end;  

run;

data have;
  input name $ 1-12 age;
  cards;
Urvish Shah 20
B           30
C           40
;
run;








  





