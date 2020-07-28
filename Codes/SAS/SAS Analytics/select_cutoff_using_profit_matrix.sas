libname data "D:\Data Science using SAS and Python\Data";

%let pi1 = 0.02;
%let rho1 = 0.346361;

/* Add the decision variable    */
/* (based on the profit matrix) */
/* and calculate profit         */ 
data scoval;
   set data.scoval;
   sampwt = (&pi1/&rho1)*(INS) 
            + ((1-&pi1)/(1-&rho1))*(1-INS);
   decision = (p_1 > 0.01);
   profit = decision*INS*99
            - decision*(1-INS)*1;
run;

/* Calculate total and average profit */
proc means data=scoval sum mean;
   weight sampwt;
   var profit;
run;

/* Investigate the true positive and */
/* false positive rates and analyse whether given cutoff maximize the profit */
data roc;
   set data.roc;
   AveProf = 99*tp - 1*fp;
run;

proc sgplot data = roc;
  where cutoff le 0.05;
  refline .01 / axis = x;
  series y = AveProf x = cutoff;
  yaxis label = "Average Profit";  
quit;
