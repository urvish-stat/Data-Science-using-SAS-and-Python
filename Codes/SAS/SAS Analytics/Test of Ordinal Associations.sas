******************************************************************;
*  COURSE NAME  : Categorical Data Analysis using SAS;
*  AUTHOR NAME  : Urvish Shah;
*  PROGRAM NAME : Test of Ordinal Associations.sas
*  PURPOSE      : Test of Associations among categorical variables
                  whose level of measurement are ordinal	
******************************************************************;

** Custom Format for Survived variable;
proc format;
  value survfmt 
     1 = "Survived"
     0 = "Died";
run;

** Exploring general association;
proc freq data = sasuser.titanic;
  tables survived class survived*class;
  format survived survfmt.;
  title "Cross Tabulation table for Survived by Class";
run;

** Test of Ordinal Association;
proc freq data = sasuser.titanic;
  tables survived*class / chisq measures expected cellchi2 nocol nopercent cl;
  format survived survfmt.;
  title "Test of Ordinal Association for Survived and Class";
run;

** MEASURES: produces the Spearman Correlation statistic along with measure of association
   CL: produces confidence bounds for the measures statistic ;
