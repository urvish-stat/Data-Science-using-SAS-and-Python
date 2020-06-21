/*

CODE NAME: ANOVA.SAS
PURPOSE: DEMO OF ANOVA MODELLING USING PROC GLM

*/

libname data "/folders/myfolders";
** Look for the Regional group separately;
proc means data = data.store maxdec = 3 printalltypes;
  class region;
  var electronic_sales;
  title "Descriptive Statistics of Eletronic Sales across regions";
run;

proc sgplot data = data.store;
  vbox electronic_sales / category = region datalabel = region;
  title "Box and Whisker plot of Eletronic Sales across regions";
run;

/*One Way ANOVA*/
proc glm data = data.store;
  class region;
  model electronic_sales = region;
  title "Fit One Way ANOVA Model";
run;
quit;

/*Assumptions check for ANOVA*/
proc glm data = data.store plots(only) = diagnostics(unpack);
  class region;
  model electronic_sales = region;
  means region/hovtest;
  title "Assumption check for ANOVA Model";
run;
quit;

/*ANOVA Post Hoc Studies*/
proc glm data = data.store alpha = 0.10 plots(only) = difplot(center);
  class region;
  model electronic_sales = region;
  lsmeans region / pdiff = all adjust = tukey;
  title "Post Hoc Studies by using LSMEANS Statement";
run;
quit;

/*Two Way ANOVA with interaction*/
proc format;
  value dosefmt 1 = 'Placebo'
                2 = '50 mg'
				3 = '100 mg'
				4 = '200 mg';
run;

proc means data = data.drug nway noprint;
  format drugdose dosefmt.;
  class drugdose disease;
  var bloodp;
  output out = means mean = bloodp_mean;
  title "Selected Descriptive Statistics for DRUG Dataset";
run;

proc sgplot data = means;
  series x = drugdose y = bloodp_mean / group = disease markers;
  xaxis integer;
  format drugdose dosefmt.;
  title "Plot of Means for Drug Dataset";
run;

proc glm data = data.drug plots(only) = diagnostics(unpack);
  class drugdose disease;
  model bloodp = drugdose disease drugdose*disease / ss3;
  title "Two Way ANOVA with interaction";
run;
quit;

proc glm data = data.drug;
  class drugdose disease;
  model bloodp = drugdose disease drugdose*disease / ss3;
  lsmeans drugdose*disease / slice = disease;
  title "Analyze the effects of Drugdose";
  title2 "at Each Level of Disease";
run;
quit;

data MGGarlic;
    input @1 Fertilizer 1. @3 BulbWt 7.5 @11 Cloves 7.4 @19 BedID 5.;
    datalines;
4 0.20901 11.5062 30402
3 0.25792 12.2550 23423
2 0.21588 12.0982 20696
4 0.24754 12.9199 25412
1 0.24402 12.5793 10575
3 0.20150 10.6891 21466
1 0.20891 11.5416 14749
4 0.15173 14.0173 25342
2 0.24114  9.9072 20383
3 0.23350 11.2130 23306
3 0.21481 11.2933 22730
2 0.19560 10.0428 19533
3 0.22271 11.4917 23104
2 0.15851 12.4579 19316
4 0.17713 12.6372 25759
1 0.23277 11.1439 18057
3 0.23229 12.5118 22934
3 0.18914 12.1337 21414
1 0.20161 13.1160 14158
3 0.21213 11.8415 22006
1 0.25285 12.0435 18652
2 0.22152 11.6716 20805
1 0.25362 11.4838 16662
1 0.24118 12.5481 14607
3 0.25785 10.1495 22981
3 0.27828 10.7842 22741
3 0.22790 11.7475 24758
1 0.20530 12.0564 14192
1 0.18840 13.0964 14578
2 0.23194 10.9575 20897
2 0.18979 12.0743 19493
2 0.21414 12.7071 19588
;
run;