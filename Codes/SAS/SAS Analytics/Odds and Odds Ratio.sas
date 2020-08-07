******************************************************************;
*  COURSE NAME  : Categorical Data Analysis using SAS;
*  AUTHOR NAME  : eduCBA;
*  PROGRAM NAME : Odds and Odds Ratio.sas
*  PURPOSE      : Test of Associations among categorical variables
                  by using Odds and Odds Ratio. 
******************************************************************;

** Custom Format for Survived variable;
proc format;
  value survfmt 
     1 = "Survived"
     0 = "Died";
run;

** Test of Association between Gender and Survived;
proc freq data = sasuser.titanic;
  tables (gender class) * survived / chisq cellchi2 expected nocol nopercent relrisk;
  format survived survfmt.;
  title1 "Test of Association between Gender and Survived";
  title2 "by using Odds and Odds Ratio";
run;

** RELRISK: prints the table with risk ratios (probability ratio) and odds ratio;
** OR = (OR-1)*100;
