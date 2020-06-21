/*

CODE NAME: CONFIDENCE_INTERVAL.SAS
PURPOSE: DEMO OF CONFIDENCE INTERVAL USING PROC MEANS

*/

/*Import the Data*/
%let path = C:\Users\sinurs\Urvish\SAS\SAS Courses\Data;
proc import datafile = "&path\MF2000.xls"
   out = returns replace;
   sheet = "Data";
run;

/*Standard Error of the Mean and Confidence Interval of the Mean*/
proc means data = returns mean clm stderr maxdec = 2;
  var _3Yr_Return;
run;
