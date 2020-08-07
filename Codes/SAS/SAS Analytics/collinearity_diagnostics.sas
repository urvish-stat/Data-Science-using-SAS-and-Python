** Load Input dataset;
data fitness;
    input @1 Name $8. @10 Gender $1. @12 RunTime 5.2 @18 Age 2. @21 Weight 5.2 
        @27 Oxygen_Consumption 5.2 @33 Run_Pulse 3.
        @37 Rest_Pulse 2. @40 Maximum_Pulse 3.;
    Performance=260-round(10*runtime + 2*age + 4*(Gender='F'));
    datalines;
Donna    F  8.17 42 68.15 59.57 166 40 172
Gracie   F  8.63 38 81.87 60.06 170 48 186
Luanne   F  8.65 43 85.84 54.30 156 45 168
Mimi     F  8.92 50 70.87 54.63 146 48 155
Chris    M  8.95 49 81.42 49.16 180 44 185
Allen    M  9.22 38 89.02 49.87 178 55 180
Nancy    F  9.40 49 76.32 48.67 186 56 188
Patty    F  9.63 52 76.32 45.44 164 48 166
Suzanne  F  9.93 57 59.08 50.55 148 49 155
Teresa   F 10.00 51 77.91 46.67 162 48 168
Bob      M 10.07 40 75.07 45.31 185 62 185
Harriett F 10.08 49 73.37 50.39 168 67 168
Jane     F 10.13 44 73.03 50.54 168 45 168
Harold   M 10.25 48 91.63 46.77 162 48 164
Sammy    M 10.33 54 83.12 51.85 166 50 170
Buffy    F 10.47 52 73.71 45.79 186 59 188
Trent    M 10.50 52 82.78 47.47 170 53 172
Jackie   F 10.60 47 79.15 47.27 162 47 164
Ralph    M 10.85 43 81.19 49.09 162 64 170
Jack     M 10.95 51 69.63 40.84 168 57 172
Annie    F 11.08 51 67.25 45.12 172 48 172
Kate     F 11.12 45 66.45 44.75 176 51 176
Carl     M 11.17 54 79.38 46.08 156 62 165
Don      M 11.37 44 89.47 44.61 178 62 182
Effie    F 11.50 48 61.24 47.92 170 52 176
George   M 11.63 47 77.45 44.81 176 58 176
Iris     F 11.95 40 75.98 45.68 176 70 180
Mark     M 12.63 57 73.37 39.41 174 58 176
Steve    M 12.88 54 91.63 39.20 168 44 172
Vaughn   M 13.08 44 81.42 39.44 174 63 176
William  M 14.03 45 87.66 37.39 186 56 192
;
run;

** Collinearity Diagnostics on FULL Model;
ods graphics off;
proc reg data = fitness; 
  FULLMODEL: model Oxygen_Consumption = performance runtime age weight 
                                        run_pulse rest_pulse maximum_pulse
                                        / vif;
  title "Collinearity check on Full Model";
quit;  

** Remove performance variable from the model;
proc reg data = fitness; 
  without_performance: model Oxygen_Consumption = runtime age weight 
                                                  run_pulse rest_pulse maximum_pulse
                                                  / vif;
  title "Collinearity check on Model without performance variable";
quit;  

** Remove maximum_pulse variable from the model;
proc reg data = fitness; 
  without_maximum_pulse: model Oxygen_Consumption = runtime age weight 
                                                    run_pulse rest_pulse 
                                                    / vif;
  title "Collinearity check on Model without maximum_pulse variable";
quit;  

ods graphics on;
