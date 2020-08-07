******************************************************************;
*  COURSE NAME  : Categorical Data Analysis using SAS;
*  AUTHOR NAME  : Urvish Shah;
*  PROGRAM NAME : Fisher's Exact p-values.sas
*  PURPOSE      : Chi-Square test with Fisher's Exact p-values
******************************************************************;

** Input Data; 
data Exact_p_values;
  input A B;
  datalines;
1 2
1 2
1 2
2 1
2 1
2 2
2 2
;
run;

** Perform the Chi-Square statistics;
proc freq data = Exact_p_values;
  tables A*B / expected chisq cellchi2 nocol nopercent;
run;

** NOTE: For tables larger than 2*2, Fisher's Exact p-values can be produced 
         by using EXACT statement and it can take more computational time;
