libname data "D:\Data Science using SAS and Python\Data";                                                                   
                                                                                                                                        
%let pi1=0.02;                                                                                                                          
                                                                                                                                        
proc sql noprint;                                                                                                                       
   select mean(ins) into :rho1 from data.develop;                                                                                       
quit;                                                                                                                                   
                                                                                                                                        
%let inputs=ACCTAGE DDA DDABAL DEP DEPAMT CASHBK                                                                                        
            CHECKS DIRDEP NSF NSFAMT PHONE TELLER                                                                                       
            SAV SAVBAL ATM ATMAMT POS POSAMT CD                                                                                         
            CDBAL IRA IRABAL LOC LOCBAL INV                                                                                             
            INVBAL ILS ILSBAL MM MMBAL MMCRED MTG                                                                                       
            MTGBAL CC CCBAL CCPURC SDB INCOME                                                                                           
            HMOWN LORES HMVAL AGE CRSCORE MOVED                                                                                         
            INAREA;                                                                                                                     
                                                                                                                                        
%let selected =                                                                                                                         
MIPhone TELLER MM LOC CD                                                                                                                
ATMAMT brclus2 INV DEP IRA                                                                                                              
MTGBAL ACCTAGE SAVBAL B_DDABal SAV                                                                                                      
PHONE CCBAL DIRDEP ATM; 

** Create offset variable to account for rare event;
data data.train;                                                                                                                        
  set data.train;                                                                                                                       
  off = log(((1-&pi1.) * &rho1.) / (&pi1. * (1-&rho1.)));                                                                               
run;                                                                                                                                    

** Fit a Logistic Regression Model on training data;                                                                                                                                        
proc logistic data = data.train plots(only) = oddsratio;                                                                                
  model ins(event = '1') = &selected. / offset = off;                                                                                     
  title "Logistic Regression Model on Training Dataset";                                                                                
quit;       

** Score the Validation dataset using Model fitted on training dataset; 
ods select roccurve scorefitstat;                                                                                                                           
proc logistic data = data.train;
  model ins(event = '1') = &selected.;
  score data = data.valid out = data.scoval
    priorevent = &pi1. /* Adjust Oversample dataset */
	outroc = data.roc /* Generate different roc statistics for assessment */
	fitstat /* Generate model fit statistics */;
quit;
	
** Create Confusion Matrix on Validation dataset;
data data.roc;
   set data.roc;
   cutoff=_PROB_;
   specif=1-_1MSPEC_;
   tp=&pi1*_SENSIT_;
   fn=&pi1*(1-_SENSIT_);
   tn=(1-&pi1)*specif;
   fp=(1-&pi1)*_1MSPEC_;
   depth=tp+fp;
   pospv=tp/depth;
   negpv=tn/(1-depth);
   acc=tp+tn;
   lift=pospv/&pi1;
   keep cutoff tn fp fn tp 
        _SENSIT_ _1MSPEC_ specif depth
        pospv negpv acc lift;
run;

** Create Lift chart on Validation dataset;
proc sgplot data = roc;
  where 0.005 <= depth <= 0.50;
  series y = lift x = depth;
  refline 1 / axis = y;
  yaxis values = (0 to 8 by 1);
quit;
  

