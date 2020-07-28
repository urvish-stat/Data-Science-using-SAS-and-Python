** Load the input data;
proc import datafile = "/folders/myfolders/fitness.xlsx" out = fitness
  dbms = xlsx replace;
run;

** Pearson correlation to check for linearity with oxygen_consumption;  
proc corr data = fitness rank plots(only) = scatter(ellipse = none);
  var runtime age weight run_pulse 
      rest_pulse maximum_pulse performance;
  with oxygen_consumption;
  id name;
  title "Correlation and Scatter Plots with oxygen_consumption";
run;

** Pearson correlation matrix to check for linearity among predictors;  
proc corr data = fitness rank plots(only) = matrix(histogram);
  var runtime age weight run_pulse 
      rest_pulse maximum_pulse performance;
  title "Correlation and Scatter Plots matrix of predictors";
run;
