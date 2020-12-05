** SAS Macros;

%let response_var = weight;
%let dsn = sashelp.class;

proc means data = &dsn.;
  var &response_var.;
run;

%macro get_desc_stats(dsn =,response_var =);

   data want;
     set &dsn.(keep = &response_var.);
   run;
   
   proc means data = want;
     var &response_var.;
   run;
      
%mend get_desc_stats;

%get_desc_stats(response_var = inventory, dsn = sashelp.shoes);
