/*

CODE NAME: DESCRIPTIVE_STATISTICS.SAS
PURPOSE: DEMO OF DESCRIPTIVE STATISTICS USING PROC MEANS

*/

/*Import the Data*/
%let path = C:\Users\SONY\Desktop\DS Using SAS & Python\Data;
proc import datafile = "&path\MF2000.xls"
   out = returns replace;
   sheet = "Data";
run;

/*Descriptive Statistics using proc means*/
proc means data = returns maxdec = 2;
  class risk;
  var _3Yr_Return;
  title "Proc Means Default Stat for Returns across risk category";
run;

/*Calculation of spesific statistics*/
proc means data = returns maxdec = 2 mean median q1 q3 std var;
  class risk;
  var _3Yr_Return;
  title "Specific Stat for Returns across risk category";
run;


  
