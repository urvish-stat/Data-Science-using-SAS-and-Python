** Data Step;
data have;
  set sashelp.class;
run;

** Proc Step;
options number;
proc print data = have noobs;
  var name height;
run;

** FORMAT/INFORMAT Example;
data dates;
  format curr_date date9.;
  curr_date = today();
run;

** Descriptive Portion of Have dataset;
proc contents data = have;
run;

** Two Digit Year dates;
options yearcutoff = 1920; ** Time span from 1920 to 2019;
data two_digit_yr;
  format year date9.;
  year = "01JAN20"d;
run;

options firstobs = 5 obs = 10;
proc print data = have;
run;

options obs = max firstobs = 1;
proc print data = have;
run;

** Syntax Error;
data test
  set sashelp.class;
run;

** Data Error;
data test;
  name = "My Name";
run;
proc print data = test;
run;

