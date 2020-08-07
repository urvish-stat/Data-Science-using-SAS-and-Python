******************************************************************;
*  COURSE NAME  : Categorical Data Analysis using SAS;
*  AUTHOR NAME  : eduCBA;
*  PROGRAM NAME : Multiple Logistic Regression.sas
*  PURPOSE      : Multiple Logistic Regression Model by adding 
                  combination of continuous and categorical predictor variables.
******************************************************************;

** Custom Format for Survived variable;
proc format;
  value survfmt 
     1 = "Survived"
     0 = "Died";
run;

ODS GRAPHICS ON;
** Fit a Binary Logistic Regression Model by adding 
   (Continuous) Age, (Categorical) Gender and Class predictos;
proc logistic data = sasuser.titanic plots(only) = (effect oddsratio);
  ** Specify the categorical predictor variables in CLASS Statement.
     I used the "Reference Level Coding Scheme" to create design variables
     for Gender and Class variables;
  class gender(ref='male') class(ref='3') / param = ref;
  model survived(event = '1') = age gender class / clodds = pl;
  units age = 10;
  title "Multiple Logistic Regressioin Model with Survived = Age Gender Class";
run;
quit;

ODS GRAPHICS OFF;

** UNITS: enables you to specify the units of change for continuous predictor variables so that 
          customized odds ratio can be estimated.

   (REF = 'LEVEL'): specifies the event category chosen as reference level when using Reference or 
                    Effect parameterazation. You have to specify the value of reference level in quotation marks.

   PARM=: specifies the parameterization. The value can be specified for each CLASS variable by typing it within 
          parentheses after the variable name, or for all CLASS variables, by typing it after the option slash(/)
          at the end of CLASS variables;

** Fit a Multiple Logistic Regression Model by using Backward Elimination Method with Interactions
   The full model should include all the main effects and two-way interactions;
ODS GRAPHICS ON;

proc logistic data = sasuser.titanic plots(only) = (effect oddsratio);
  class gender(ref='male') class(ref='3') / param = ref;
  ** Consider only two-factor interaction by using "@ and |" notation;
  model survived(event='1') = age|gender|class @2 / selection = backward slstay = 0.01;
  units age = 10;
  title "Multiple Logistic Regressioin Model : Backward Elimination Survived = age|gender|class";
run;
quit;

ODS GRAPHICS OFF;

** Producing the ODDSRATIO for interacting variables;
ODS GRAPHICS ON;

proc logistic data = sasuser.titanic plots(only) = (effect oddsratio);
  class gender(ref='male') class(ref='3') / param = ref;
  ** Consider only two-factor interaction by using "@ and |" notation;
  model survived(event='1') = age|gender|class @2 / selection = backward slstay = 0.01;
  units age = 10;
  oddsratio gender / at (class=ALL);
  oddsratio class / at (gender=ALL);
  title "Multiple Logistic Regressioin Model : ODDSRATIO for interacting variables";
run;
quit;

ODS GRAPHICS OFF;
