/*

CODE NAME: HYPOTHESIS_TESTING.SAS
PURPOSE: DEMO OF HYPOTHESIS TESTING USING PROC TTEST

*/

/*Import the Data*/
%let path = C:\Users\sinurs\Urvish\SAS\SAS Courses\Data;
proc import datafile = "&path\invoices.xls"
   out = invoices replace;
   sheet = "Data";
run;

/* One Sample t-test */
proc ttest data = invoices h0 = 120 plots(shownull) = interval;
  var sales;
  title "One Sample t-test by using Proc Ttest";
run;

/* One-Side Tail t-test */
proc ttest data = invoices h0 = 120 sides = l plots(shownull) = interval;
  var sales;
  title "One-Side Tail t-test by using Proc Ttest";
run;

/*Import the Data*/
proc import datafile = "&path\COLA.xls"
   out = cola replace;
   sheet = "Data";
run;

/* Two Sample t-test */
ods trace on;
ods output  Equality =  Equality;
proc ttest data = cola;
  class display_type;
  var sales;
  title "Two Sample t-test by using Proc Ttest";
run;
ods trace off;

/*Import the Data*/
proc import datafile = "&path\comptime.xls"
   out = comptime replace;
   sheet = "Data";
run;

data comptime;
  retain financial_projects;
  set comptime;
  financial_projects = _N_;
  D = current - new;
run;

/* Paired Samples t-test */
proc ttest data = comptime H0 = 0;
  var D;
  title "Paired Samples t-test by using Proc Ttest";
run;

