******************************************************************;
*  COURSE NAME  : Categorical Data Analysis using SAS;
*  AUTHOR NAME  : Urvish Shah;
*  PROGRAM NAME : Test of Associations.sas
*  PURPOSE      : Test of Associations among categorical variables 	
******************************************************************;

** Custom Format for Survived variable;
proc format;
  value survfmt 
     1 = "Survived"
     0 = "Died";
run;

** Perform the Chi-Square test for gender by survived and
   class by survived. ;
proc freq data = sasuser.titanic;
  tables (gender class)*survived / chisq expected cellchi2 nocol nopercent;
/*  tables gender*survived class*survived;*/
  format survived survfmt.;
  title "Association of Survived with Gender and Class";
run;

** CHISQ: produces the chi-square test of association and measure of association 
          based on the chi-square statistics. 
   EXPECTED: prints the expected cell frequencies under the hypothesis of
             no association. 
   CELLCHI2: prints each cell's contribution to the total chi-square statistics.
   NOCOL: suppresses printing the column percentages.
   NOPERCENT: suppresses printing the cell percentages.;

