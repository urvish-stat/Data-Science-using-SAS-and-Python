** Creating own library;
libname my_data "/folders/myfolders";
data my_data.retail;
  set sashelp.shoes;
run;

** Get the data inside the SAS;
data have;
  format curr_date next_day date9.;
  input name $12. age income curr_date date9.;
  next_day = curr_date + 1;
  cards;
Rohan Patel 25 10000 14JUN2020
Urvish Shah 26 10000 14JUN2020
;
run;

** Get the data external to SAS;
data stress;
  infile "/folders/myfolders/tredmil.txt";
  input ID 1-4 Name $ 6-25 RestHr 27-29 MaxHR 31-33
         RecHR 35-37 TimeMin 39-40 TimeSec 42-43 
         Tolerance $ 45; 
  ** Subset the dataset;
  if tolerance = "D" then output;
run;

** Read the excel/csv files;
** SAS Access to PC files;
proc import datafile = "/folders/myfolders/MF2000.xls" 
   out = mf_data(drop = I) replace dbms = xls;
   sheet = "Data";
run;

** Export the SAS Datasets;
proc export data = sashelp.shoes 
   outfile = "/folders/myfolders/retail.xlsx"
   dbms = xlsx replace; sheet = "Retail Data";
run;

** Export the SAS Datasets;
proc export data = sashelp.class 
   outfile = "/folders/myfolders/retail.xlsx"
   dbms = xlsx replace; sheet = "Class Data";
run;


