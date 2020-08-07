******************************************************************;
*  COURSE NAME  : Categorical Data Analysis using SAS;
*  AUTHOR NAME  : eduCBA;
*  PROGRAM NAME : Honest Assessment.sas
*  PURPOSE      : Apply the principles of honest assessment 
                  to model performance measurement
******************************************************************;

%let inputs=ACCTAGE DDA DDABAL DEP DEPAMT CASHBK 
            CHECKS DIRDEP NSF NSFAMT PHONE TELLER 
            SAV SAVBAL ATM ATMAMT POS POSAMT CD 
            CDBAL IRA IRABAL LOC LOCBAL INV 
            INVBAL ILS ILSBAL MM MMBAL MMCRED MTG 
            MTGBAL CC CCBAL CCPURC SDB INCOME 
            HMOWN LORES HMVAL AGE CRSCORE MOVED 
            INAREA;

/* Create missing indicators */
data product_info(drop=i);
   set sasuser.product_info;
   /* name the missing indicator variables */
   array mi{*} MIAcctAg MIPhone MIPOS MIPOSAmt 
               MIInv MIInvBal MICC MICCBal 
               MICCPurc MIIncome MIHMOwn MILORes
               MIHMVal MIAge MICRScor;
   /* select variables with missing values */
   array x{*} acctage phone pos posamt 
              inv invbal cc ccbal
              ccpurc income hmown lores 
              hmval age crscore;
   do i=1 to dim(mi);
      mi{i}=(x{i}=.);
   end;
run;

/* Sort the data by the target   */
/* in preparation for stratified */
/* sampling.                     */
proc sort data=product_info out=product_info; 
   by ins; 
run;

/* The SURVEYSELECT procedure will  */
/* perform stratified sampling on   */
/* any variable in the STRATA       */
/* statement.  The OUTALL option    */
/* specifies that you want a flag   */
/* appended to the file to indicate */
/* selected records, not simply a   */
/* file comprised of the selected   */
/* records.                         */
proc surveyselect noprint
                  data = product_info 
                  samprate=.6667 
                  out=product_info
                  seed=44444
                  outall;
   strata ins;
run;

/* Verify stratification */
proc freq data = product_info;
tables ins*selected;
run;


/* Create training and validation data sets */
data train valid;
   set product_info;
   if selected then output train;
   else output valid;
run;

/* Impute missing values with the median */
proc stdize data=train 
            reponly 
            method=median 
            out=train1;
   var &inputs;
run;

/* Clustering Nominal Variable levels output based on algorithm */
data train1;
   set train1;
   brclus1=(branch='B14');
   brclus2=(branch in ('B12','B5','B8',
                       'B3','B18','B19','B17',
                       'B4','B6','B10','B9',
                       'B1','B13'));
   brclus3=(branch in ('B15','B16'));
run;

/* Dimension Reduction output based on algorithm */
%let reduced=
MIPhone MIIncome Teller MM 
Income ILS LOC POSAmt
NSFAmt CD LORes CCPurc
ATMAmt brclus2 Inv Dep
CashBk Moved IRA CRScore
MIAcctAg IRABal MICRScor MTGBal 
AcctAge SavBal DDABal SDB
InArea Sav Phone CCBal 
InvBal MTG HMOwn DepAmt
DirDep ATM brclus1 Age;

/* Drop HMOwn, MIIncome, Moved, & LORes based on algorithm*/
%let screened = 
MIPhone Teller MM 
Income ILS LOC POSAmt
NSFAmt CD CCPurc
ATMAmt brclus2 INV DEP
CashBk IRA CRScore
MIAcctAg IRABal MICRScor MTGBal 
AcctAge SavBal DDABal SDB
InArea Sav Phone CCBal 
INVBal MTG DEPAmt
DirDep ATM brclus1 Age;

/* Accommodate non-linearities in balances */
proc sql;
select mean(ddabal) into :mean 
from train1 where dda;
quit;

data train1;
set train1;
if not dda then ddabal = &mean;
run;

ddabal bin
20     1 
10     2
50     1
60     2
10     100
20     100
proc rank data=train1 groups=100 out=out;
   var ddabal;
   ranks bin;
run;

proc means data = out noprint nway;
class bin;
var ddabal;
output out=endpts max=max;
run;

filename rank "C:\temp\rank.sas";

data _null_;
file rank;
set endpts end=last;
if _n_ = 1 then put "select;";
if not last then do;
  put "  when (ddabal <= " max ") B_DDABal =" bin ";";
  end;
else if last then do;
  put "otherwise B_DDABal =" bin ";";
  put "end;";
  end;
run;

/* Bin DDABal, truncate SavBal */
data train1;
   set train1;
   %include rank /source2;
   if savbal > 16000 then savbal=16000;
run;

/* Replace DDABal with B_DDABal */
%let screened = 
MIPhone Teller MM 
Income ILS LOC POSAmt
NSFAmt CD CCPurc
ATMAmt brclus2 INV DEP
CashBk IRA CRScore
MIAcctAg IRABal MICRScor MTGBal 
AcctAge SavBal B_DDABal SDB
InArea Sav Phone CCBal 
INVBal MTG DEPAmt
DirDep ATM brclus1 Age;

/* Perform some variable selection */
proc logistic data = train1 des;
   class res;
   model ins=&screened res
   / selection=backward fast slstay=.001;
run;

%let selected = 
MIPhone TELLER MM LOC CD
ATMAMT brclus2 INV DEP IRA
MTGBAL ACCTAGE SAVBAL B_DDABal SAV
PHONE CCBAL DIRDEP ATM;

/* Prepare the validation data for scoring */
proc means data = valid nmiss;
   var MIPhone Teller MM LOC CD
       ATMAmt INV DEP IRA MTGBal
       AcctAge SavBal DDABal Sav
       Phone CCBal DirDep ATM;
run;

proc univariate data=train1 noprint;
   var acctage phone inv ccbal;
   output out=medians
          pctlpts=50
          pctlpre=acctage phone inv ccbal;
run;

data valid1(drop=acctage50 phone50 inv50 ccbal50 i);
   if _N_ = 1 then set medians;
   set valid;
   array x(*) acctage phone inv ccbal;
   array med(*) acctage50 phone50 inv50 ccbal50;
      do i = 1 to dim(x);
         if x(i)=. then x(i)=med(i);
      end;
   if not dda then ddabal = &mean;
   brclus1=(branch='B14');
   brclus2=(branch in ('B12','B5','B8',
                       'B3','B18','B19','B17',
                       'B4','B6','B10','B9',
                       'B1','B13'));
   brclus3=(branch in ('B15','B16'));
   %include rank;
   if savbal > 16000 then savbal=16000;
run;

/* An easier to type (but slightly more CPU   */
/* intensive method) for imputing the medians */
/* from the training data in the validation   */
/* data is to use the STDIZE procedure with   */
/* the OUTSTAT= option.  An example follows.  */
proc stdize data = train out=train2
            method=median reponly
            OUTSTAT=med;
var &inputs;
run;

proc stdize data=valid out=valid2
            reponly method=in(med);
var &inputs;
run;

proc compare base= valid1 compare=valid2;
var acctage phone inv ccbal;
run;
