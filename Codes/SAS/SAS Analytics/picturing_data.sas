/*

CODE NAME: PICTURING_DATA.SAS
PURPOSE: DEMO OF PICTURING DATA USING PROC SGPLOT AND PROC UNIVARIATE

*/

/*Import the Data*/
%let path = C:\Users\sinurs\Urvish\SAS\SAS Courses\Data;
proc import datafile = "&path\MF2000.xls"
   out = returns replace;
   sheet = "Data";
run;

/*skewness and kurtosis using proc univariate*/
proc univariate data = returns;
  var _3Yr_Return;
  title "skewness and kurtosis using proc univariate";
run;

/*Histogram by using proc univariate*/
proc univariate data = returns noprint;
  var _3Yr_Return;
  histogram _3Yr_Return / normal(mu = est sigma = est) kernel;
  inset skewness kurtosis / position = ne;
  probplot _3Yr_Return / normal(mu = est sigma = est);
  inset skewness kurtosis;
  title "Histogram and Probability Plots by using proc univariate";	
run;

/*Histogram and Box Plot by using proc sgplot*/
proc sgplot data = returns;   
  histogram _3Yr_Return;
  title "Histogram by using proc sgplot";
quit;

proc sgplot data = returns;   
  hbox _3Yr_Return / datalabel = risk;
  title "Box Plot by using proc sgplot";
quit;

proc sgplot data = returns;   
  vbox _3Yr_Return / datalabel = risk category = risk;
  title "Box Plot across the risk category by using proc sgplot";
quit;

/*Scatter Plot using proc sgplot*/
proc sgplot data = returns;
  scatter x = return_1999 y = return_q1_2000;
  title "Scatter Plot of returns using proc sgplot";
quit;

	
