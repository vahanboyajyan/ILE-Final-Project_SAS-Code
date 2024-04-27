
/*******************************************
*         TRANSPORTING NHANES DATASETS     *
*                                          *
********************************************/
/*Setting the Libname and the file path*/

%let path = D:\Second Year\EPI 749 and 751;
libname INITIAL "&path\Paper Publishing\Initial Datasets";
libname FINAL "&path\Paper Publishing\FINAL Datasets";

/*UNZIP *.XPT (TRANSPORT FILES) FROM NHANES WEBSITE (2013-14)*/ 
libname DEMO xport "&path\ILE research proposal\Dataset 13 -14\DEMO_H.XPT";
libname DIQ xport "&path\ILE research proposal\Dataset 13 -14\DIQ_H.XPT";
libname GHB xport "&path\ILE research proposal\Dataset 13 -14\GHB_H.XPT";
libname GLU xport "&path\ILE research proposal\Dataset 13 -14\GLU_H.XPT";
libname OHXDEN xport "&path\ILE research proposal\Dataset 13 -14\OHXDEN_H.XPT";
libname OHQ xport "&path\ILE research proposal\Dataset 13 -14\OHQ_H.XPT";
libname SMQ xport "&path\ILE research proposal\Dataset 13 -14\SMQ_H.XPT";
libname BMX xport "&path\ILE research proposal\Dataset 13 -14\BMX_H.XPT";

/*UNZIP *.XPT (TRANSPORT FILES) FROM NHANES WEBSITE (2015-16)*/ 
libname DEMO1 xport "&path\ILE research proposal\dataset 15-16\DEMO_I.XPT";
libname DIQ1 xport "&path\ILE research proposal\dataset 15-16\DIQ_I.XPT";
libname GHB1 xport "&path\ILE research proposal\dataset 15-16\GHB_I.XPT";
libname GLU1 xport "&path\ILE research proposal\dataset 15-16\GLU_I.XPT";
libname OHXDEN1 xport "&path\ILE research proposal\dataset 15-16\OHXDEN_I.XPT";
libname OHQ1 xport "&path\ILE research proposal\dataset 15-16\OHQ_I.XPT";
libname SMQ1 xport "&path\ILE research proposal\dataset 15-16\SMQ_I.XPT";
libname BMX1 xport "&path\ILE research proposal\dataset 15-16\BMX_I.XPT";

/*UNZIP *.XPT (TRANSPORT FILES) FROM NHANES WEBSITE (2017-March 2020)*/ 
libname DEMO2 xport "&path\ILE research proposal\Dataset 2017 - March 2020\P_DEMO.XPT";
libname DIQ2 xport "&path\ILE research proposal\Dataset 2017 - March 2020\P_DIQ.XPT";
libname GHB2 xport "&path\ILE research proposal\Dataset 2017 - March 2020\P_GHB.XPT";
libname GLU2 xport "&path\ILE research proposal\Dataset 2017 - March 2020\P_GLU.XPT";
libname OHXDEN2 xport "&path\ILE research proposal\Dataset 2017 - March 2020\P_OHXDEN.XPT";
libname OHQ2 xport "&path\ILE research proposal\Dataset 2017 - March 2020\P_OHQ.XPT";
libname SMQ2 xport "&path\ILE research proposal\Dataset 2017 - March 2020\P_SMQ.XPT";
libname BMX2 xport "&path\ILE research proposal\Dataset 2017 - March 2020\P_BMX.XPT";

/*******************************************
*         EXPORTING NHANES DATASETS        *
*         INTO INITIAL SAS LIBRARY         *
*                                          *
********************************************/
/*Exporting the datasets (2013-14)into the initial library "INITIAL" */
proc copy in=DEMO out=INITIAL; run;
proc copy in=DIQ out=INITIAL; run;
proc copy in=GHB out=INITIAL; run;
proc copy in=GLU out=INITIAL; run;
proc copy in=OHXDEN out=INITIAL; run;
proc copy in=OHQ out=INITIAL; run;
proc copy in=SMQ out=INITIAL; run;
proc copy in=BMX out=INITIAL; run;

/*Exporting the datasets (2015-16)into the initial library "INITIAL" */
proc copy in=DEMO1 out=INITIAL; run;
proc copy in=DIQ1 out=INITIAL; run;
proc copy in=GHB1 out=INITIAL; run;
proc copy in=GLU1 out=INITIAL; run;
proc copy in=OHXDEN1 out=INITIAL; run;
proc copy in=OHQ1 out=INITIAL; run;
proc copy in=SMQ1 out=INITIAL; run;
proc copy in=BMX1 out=INITIAL; run;

/*Exporting the datasets (2017-20)into the initial library "INITIAL" */
proc copy in=DEMO2 out=INITIAL; run;
proc copy in=DIQ2 out=INITIAL; run;
proc copy in=GHB2 out=INITIAL; run;
proc copy in=GLU2 out=INITIAL; run;
proc copy in=OHXDEN2 out=INITIAL; run;
proc copy in=OHQ2 out=INITIAL; run;
proc copy in=SMQ2 out=INITIAL; run;
proc copy in=BMX2 out=INITIAL; run;

/*******************************************
*             PROC CONTENTS                *                                                                                   *
********************************************/

/*Using proc contents to display the names and dimensions of variables in each dataset (2013-14) */
proc contents data=INITIAL.DEMO_H; run;
proc contents data=INITIAL.DIQ_H; run;
proc contents data=INITIAL.GHB_H; run;
proc contents data=INITIAL.GLU_H; run;
proc contents data=INITIAL.OHXDEN_H; run;
proc contents data=INITIAL.OHQ_H; run;
proc contents data=INITIAL.SMQ_H; run;
proc contents data=INITIAL.BMX_H; run;

/*Using proc contents to display the names and dimensions of variables in each dataset(2015-16) */
proc contents data=INITIAL.DEMO_I; run;
proc contents data=INITIAL.DIQ_I; run;
proc contents data=INITIAL.GHB_I; run;
proc contents data=INITIAL.GLU_I; run;
proc contents data=INITIAL.OHXDEN_I; run;
proc contents data=INITIAL.OHQ_I; run;
proc contents data=INITIAL.SMQ_I; run;
proc contents data=INITIAL.BMX_I; run;

/*Using proc contents to display the names and dimensions of variables in each dataset(2017-20) */
proc contents data=INITIAL.P_DEMO; run;
proc contents data=INITIAL.P_DIQ; run;
proc contents data=INITIAL.P_GHB; run;
proc contents data=INITIAL.P_GLU; run;
proc contents data=INITIAL.P_OHXDEN; run;
proc contents data=INITIAL.P_OHQ; run;
proc contents data=INITIAL.P_SMQ; run;
proc contents data=INITIAL.P_BMX; run;

/************************************************************
*      SORTING NHANES DATASETS AND                          *
*      HORIZONTAL MERGE FOR EACH NHANES CYCLE AND           *
*      VERTICAL MERGE INTO ONE DATASET                      *
*                                                           *
*************************************************************/

/*Sorting the datasets by their unique identifiers (2013-14)*/
proc sort data=INITIAL.DEMO_H;; by SEQN ; run;
proc sort data=INITIAL.DIQ_H; by SEQN ; run;
proc sort data=INITIAL.GHB_H; by SEQN ; run;
proc sort data=INITIAL.GLU_H; by SEQN ; run;
proc sort data=INITIAL.OHXDEN_H; by SEQN ; run;
proc sort data=INITIAL.OHQ_H; by SEQN; run;
proc sort data=INITIAL.SMQ_H; by SEQN; run;
proc sort data=INITIAL.BMX_H; by SEQN; run;

/*Merge datasets together using their unique identifiers as a common variable (2013-14)*/
data FINAL.MERGED;
merge INITIAL.DEMO_H INITIAL.DIQ_H INITIAL.GHB_H INITIAL.GLU_H INITIAL.OHXDEN_H INITIAL.OHQ_H INITIAL.SMQ_H INITIAL.BMX_H; by SEQN;
run;

/*Sorting the datasets by their unique identifiers (2015-16)*/
proc sort data=INITIAL.DEMO_I;; by SEQN ; run;
proc sort data=INITIAL.DIQ_I; by SEQN ; run;
proc sort data=INITIAL.GHB_I; by SEQN ; run;
proc sort data=INITIAL.GLU_I; by SEQN ; run;
proc sort data=INITIAL.OHXDEN_I; by SEQN ; run;
proc sort data=INITIAL.OHQ_I; by SEQN; run;
proc sort data=INITIAL.SMQ_I; by SEQN; run;
proc sort data=INITIAL.BMX_I; by SEQN; run;

/*Merge datasets together using their unique identifiers as a common variable (2015-16)*/
data FINAL.MERGED_1;
merge INITIAL.DEMO_I INITIAL.DIQ_I INITIAL.GHB_I INITIAL.GLU_I INITIAL.OHXDEN_I INITIAL.OHQ_I INITIAL.SMQ_I INITIAL.BMX_I; by SEQN;
run;

/*Sorting the datasets by their unique identifiers (2017-18)*/
proc sort data=INITIAL.P_DEMO;; by SEQN ; run;
proc sort data=INITIAL.P_DIQ; by SEQN ; run;
proc sort data=INITIAL.P_GHB; by SEQN ; run;
proc sort data=INITIAL.P_GLU; by SEQN ; run;
proc sort data=INITIAL.P_OHXDEN; by SEQN ; run;
proc sort data=INITIAL.P_OHQ; by SEQN; run;
proc sort data=INITIAL.P_SMQ; by SEQN; run;
proc sort data=INITIAL.P_BMX; by SEQN; run;

/*Merge datasets together using their unique identifiers as a common variable (2017-18)*/
data FINAL.MERGED_2;
merge INITIAL.P_DEMO INITIAL.P_DIQ INITIAL.P_GHB INITIAL.P_GLU INITIAL.P_OHXDEN INITIAL.P_OHQ INITIAL.P_SMQ INITIAL.P_BMX; by SEQN;
run;


/*Vertical Merging of datasets from different NHANES cycles*/
data FINAL.COMBINED;
    set FINAL.MERGED FINAL.MERGED_1 FINAL.MERGED_2;
run;

/***************************************************************
*     EXCLUSION/INCLUSION CRITERIA AND                         *
*     CREATING SMALLER DATASETS AND                            *
*     INCLUDING ONLY VARIABLES OF INTEREST                     *
*                                                              *
****************************************************************/
/*Determining Exclusion/Inclusion criteria*/
data FINAL.COMBINED;
set  FINAL.COMBINED;
if RIDAGEYR ge 25 then age_exclude = 0; else age_exclude = 1; 
run;

proc freq data=FINAL.COMBINED;
table age_exclude;
run; 

/*Creating a substet with only eligible participants*/
/*Excluding particIpants < 25 */
data FINAL.SUBSET; /*N=19083*/
set FINAL.COMBINED; /*N=35706*/
where age_exclude = 0;
run;


/*Creating a new smaller dataset which is a subset  
containing only variables of interest */
data FINAL.COMBINED_SHORT;
set FINAL.COMBINED;
keep  SEQN age_exclude SDDSRVYR SDMVPSU SDMVSTRA WTINT2YR WTMEC2YR WTINTPRP WTMECPRP RIDAGEYR RIAGENDR RIDRETH3 DMDEDUC2 DMDEDUC3 INDFMIN2 INDFMPIR SMQ020 SMQ040 BMXBMI OHQ030 DIQ010 LBXGH OHDEXSTS OHX02CTC OHX03CTC OHX04CTC OHX05CTC OHX06CTC
OHX07CTC OHX08CTC OHX09CTC OHX10CTC OHX11CTC OHX12CTC OHX13CTC OHX14CTC OHX15CTC OHX18CTC OHX19CTC OHX20CTC OHX21CTC OHX22CTC OHX23CTC OHX24CTC OHX25CTC OHX26CTC OHX27CTC OHX28CTC OHX29CTC OHX30CTC OHX31CTC; 
run;

/*Running frequency tables and sample statistics for some variables to see their distribution before operationalization into analytic variables*/
/*Variable representing weights*/
proc freq data=FINAL.COMBINED_SHORT;
table WTMEC2YR;
run;
/*self-reported Diabetes*/
proc freq data=FINAL.COMBINED_SHORT;
table DIQ010;
run;
/*glycohemoglobin test*/
proc univariate data=FINAL.COMBINED_SHORT;
var LBXGH;
run;
/*Variables for smoking*/
proc freq data=FINAL.COMBINED_SHORT;
table SMQ020 SMQ040 ;
run;
/*Relationship and missing values for variables in smoking*/
proc freq data=FINAL.COMBINED_SHORT;
table SMQ020*SMQ040 ;
run;
/*Variable for BMI*/
proc freq data=FINAL.COMBINED_SHORT;
table BMXBMI;
run;

/******************************************************************
*                  VARIABLE OPERATIONALIZATION                    *
*******************************************************************/
/*Formatting the new variables into categories*/
proc format;
value DIAB_STATUS
1= "Diabetes"
2= "Prediabetes"
3= "No diabates";
value DIAB_CONTROL
1= "Poor"
2= "Moderate"
3= "Good";
value DMFT_CAT
1= "High Caries Exp"
0= "Low Caries Exp";
value SEX
1="Male"
2="Female";
value AGE_CAT
1= "25-34"
2= "35-49"
3= "50-64"
4= "65 years and older";
value RACE
1= "Hispanic"
2= "Non-Hispanic White"
3= "Non-Hispanic Black"
4= "Non-Hispanic Asian"
5= "Other Race - Including Multi-Racial";
value EDUCATION
1= "High School or less"
2= "Some college or more";

value SMOKING_STATUS
1= "Current smoker"
2= "Former smoker"
3= "Never smoker";
value BODY_WEIGHT
1= "Underweight"
2= "Normal weight"
3= "Overweight"
4= "Obese";
value DENTAL_VISIT
1= "0-1 years ago"
2= "1-3 years ago"
3= "3-5 years ago"
4= "5 years ago or never";
value RATIO_INC_POV
1= "<100%"
2= "100-199%"
3= "200-399%"
4= ">=400";
run;

data FINAL.COMBINED_SHORT;
set FINAL.COMBINED_SHORT;

/*Adjusting weights for 3 NHANES cycles*/
/*Interview weights*/
if sddsrvyr in (8 9) then WTMEC7YR = 24/86 * WTMEC2YR;
else if sddsrvyr in (66) then WTMEC7YR = 38/86 * WTMECPRP;


/*MEC exam weights*/
if sddsrvyr in (8 9) then WTINT7YR = 24/86 * WTINT2YR;
else if sddsrvyr in (66) then WTINT7YR = 38/86 * WTINTPRP;


/*Creating a variable for Diabetes Status */
if DIQ010 in (7 9 .) and LBXGH = . then DIAB_STATUS=.; 
else if DIQ010 = 1 or LBXGH ge 6.5  then DIAB_STATUS = 1;
else if DIQ010 = 3 or LBXGH ge 5.7 and LBXGH le 6.4  then DIAB_STATUS = 2;
else if DIQ010 = 2 or LBXGH lt 5.7 then DIAB_STATUS = 3;

 /* Initialize counter for DMFT */
  DMFT = 0;
  /* Initialize missing count */
missing_count = 0;
  /* Loop through the 28 variables for each tooth */
  array tooth_vars{28} OHX02CTC OHX03CTC OHX04CTC OHX05CTC OHX06CTC OHX07CTC OHX08CTC OHX09CTC OHX10CTC 
OHX11CTC OHX12CTC OHX13CTC OHX14CTC OHX15CTC OHX18CTC OHX19CTC OHX20CTC OHX21CTC OHX22CTC OHX23CTC OHX24CTC
OHX25CTC OHX26CTC OHX27CTC OHX28CTC OHX29CTC OHX30CTC OHX31CTC;

   /* Loop through the 28 variables for each tooth */
  do i = 1 to 28;
    /* Check if the tooth is decayed, missing, or filled */
    if tooth_vars{i} in ('Z', 'E', 'F', 'P', 'R') then DMFT + 1;
    /* Check if the value is missing */
  if missing(tooth_vars{i}) then missing_count + 1;
end;
/* Check if more than 14 variables are missing, then set DMFT to missing */
if missing_count > 14 then DMFT = .;

/*Creating a variable for Diabetes Control*/
if DIAB_STATUS = . or DIAB_STATUS=2 or DIAB_STATUS=3 then DIAB_CONTROL = .;
else if LBXGH ge 8 then DIAB_CONTROL = 1;
  else if LBXGH ge 7 and LBXGH lt 8 then DIAB_CONTROL = 2;
  else if LBXGH lt 7 then DIAB_CONTROL = 3;

  /*Creating a categorical variable for age*/
  if RIDAGEYR =. then AGE_CAT=.;
else if RIDAGEYR ge 25 and RIDAGEYR le 34 then AGE_CAT = 1;
else if RIDAGEYR ge 35 and RIDAGEYR le 49 then AGE_CAT = 2;
else if RIDAGEYR ge 50 and RIDAGEYR le 64 then AGE_CAT = 3;
else AGE_CAT = 4;

/*Creating a new variable for Gender*/
if RIAGENDR = . then SEX = .;
else if RIAGENDR = 1 then SEX=1;
else SEX=2;
/*Creating a new variable for race*/
if RIDRETH3 = . then RACE = .;
else if RIDRETH3 = 1 or RIDRETH3 = 2 then RACE = 1;
else if RIDRETH3 = 3  then RACE = 2;
else if RIDRETH3 = 4 then RACE = 3;
else if RIDRETH3 = 6 then RACE = 4;
else if RIDRETH3 = 7 then RACE = 5;


/*Creating a new variable for education*/
if DMDEDUC2 in (7 9 .) then EDUCATION=.;
else if DMDEDUC2 = 1 or DMDEDUC2 = 2 or DMDEDUC2 = 3 then EDUCATION = 1;
else if DMDEDUC2 = 4 or DMDEDUC2 = 5 then EDUCATION = 2;

/*Creating a variable for Smoking status*/
if SMQ020 in (7 9) then SMOKING_STATUS=.;
else if SMQ020=1 and SMQ040=1 then SMOKING_STATUS=1;
else if SMQ020=1 and SMQ040=2 then SMOKING_STATUS=1;
else if SMQ020=1 and SMQ040=3 then SMOKING_STATUS=2;
else if SMQ020=2 then SMOKING_STATUS=3;


/*Creating a variable for Body Weight*/
if BMXBMI = . then BODY_WEIGHT = .;
else if BMXBMI lt 18.5 then BODY_WEIGHT = 1;
else if BMXBMI ge 18.5 and BMXBMI lt 25 then BODY_WEIGHT = 2;
else if BMXBMI ge 25 and BMXBMI lt 30 then BODY_WEIGHT = 3;
else if BMXBMI ge 30 then BODY_WEIGHT = 4;


/*Creating a variable for Last Dental Visit*/
if OHQ030 in (77 99 .) then DENTAL_VISIT = .;
else if OHQ030 in (1 2) then DENTAL_VISIT = 1;
else if OHQ030 in (3 4) then DENTAL_VISIT = 2;
else if OHQ030 = 5 then DENTAL_VISIT = 3;
else if OHQ030 in (6 7) then DENTAL_VISIT = 4;

/*Creating a variable for Family income to poverty ratio*/
if INDFMPIR=. then RATIO_INC_POV = .;
else if INDFMPIR lt 1 then RATIO_INC_POV = 1;
else if INDFMPIR ge 1 and INDFMPIR lt 2 then RATIO_INC_POV = 2;
else if INDFMPIR ge 2 and INDFMPIR lt 4 then RATIO_INC_POV = 3;
else if INDFMPIR ge 4 then RATIO_INC_POV = 4;
/*Creating a categorical variable for DMFT*/
if DMFT = . then DMFT_CAT = .;
else if DMFT ge 11 then DMFT_CAT=1;
else DMFT_CAT=0;
 
format DIAB_STATUS DIAB_STATUS. DIAB_CONTROL DIAB_CONTROL. AGE_CAT AGE_CAT. SEX SEX. RACE RACE. EDUCATION EDUCATION. 
SMOKING_STATUS SMOKING_STATUS. BODY_WEIGHT BODY_WEIGHT. DENTAL_VISIT DENTAL_VISIT. RATIO_INC_POV RATIO_INC_POV. DMFT_CAT  DMFT_CAT.;
run;

/****************************************************************************
*            EXPLORATORY DATA ANALYSIS                                      *
*****************************************************************************/

/*Frequencies and means for newly created outcome and exposure variables*/
proc freq data=FINAL.COMBINED_SHORT;
where age_exclude = 0;
table DIAB_STATUS DIAB_CONTROL DMFT_CAT;
run;
/*Frequencies of other covariates*/
proc freq data=FINAL.COMBINED_SHORT;
where age_exclude = 0;
table  EDUCATION RACE AGE_CAT SEX SMOKING_STATUS BODY_WEIGHT DENTAL_VISIT  RATIO_INC_POV;
run;

/*Looking at the data before removing missing*/
/*Running frequencies with missing data and comparing the operationalized variables with the original variables*/

/*For DMFT index*/
proc means data=FINAL.COMBINED_SHORT n nmiss min p10 p25 p50 p75 p90 max mean std;
where age_exclude = 0 and DMFT ne .;
var DMFT;
run;
proc freq data=FINAL.COMBINED_SHORT;
where age_exclude = 0;
table DMFT_CAT*DMFT/list missing;
run;

/*Diabetes*/
proc freq data=FINAL.COMBINED_SHORT; 
where age_exclude = 0;
table DIAB_STATUS*DIQ010/list missing;
run;

/*Age*/
proc means data=FINAL.COMBINED_SHORT  n nmiss min p10 p25 p50 p75 p90 max mean std;
where age_exclude = 0 and RIDAGEYR ne .; 
var RIDAGEYR; 
run;
proc freq data=FINAL.COMBINED_SHORT;
where age_exclude = 0;
table AGE_CAT*RIDAGEYR/list missing;
run;

/*Race*/
proc freq data=FINAL.COMBINED_SHORT;
where age_exclude = 0;
table RACE*RIDRETH3/list missing;
run;

/*Smoking Status*/
proc freq data=FINAL.COMBINED_SHORT;
where age_exclude = 0;
table SMOKING_STATUS*SMQ020*SMQ040/list missing;
run;

/*Education*/
proc freq data=FINAL.COMBINED_SHORT;
where age_exclude = 0;
table EDUCATION*DMDEDUC2/list missing;
run;

/*Family Income/Poverty ratio*/
proc means data=FINAL.COMBINED_SHORT  n nmiss min p10 p25 p50 p75 p90 max mean std;
where age_exclude = 0;
where INDFMPIR ne .; 
var INDFMPIR; 
run;
proc freq data=FINAL.COMBINED_SHORT;
where age_exclude = 0;
table RATIO_INC_POV*INDFMPIR/list missing;
run;

/*BMI and Body Weight*/
proc means data=FINAL.COMBINED_SHORT  n nmiss min p10 p25 p50 p75 p90 max mean std;
where age_exclude = 0;
where BMXBMI ne .; 
var BMXBMI; 
run;
proc freq data=FINAL.COMBINED_SHORT;
where age_exclude = 0;
table BODY_WEIGHT*BMXBMI/list missing;
run;

/*Last Dental Visit*/
proc freq data=FINAL.COMBINED_SHORT;
where age_exclude = 0;
table DENTAL_VISIT*OHQ030/list missing;
run;

/****************************************************************************
*            HANDLING MISSING DATA                                          *
*****************************************************************************/
/*Creating variables to subset missing observations (complete case analysis)*/
data FINAL.FINAL_MISSING; /*N=35706: if excluding people under 25 then N=19083*/
set FINAL.COMBINED_SHORT;/*N=35706*/
/*Creating indicator variables*/
/*for exposure missing*/
if DIAB_STATUS = . then EXP_MISSING = 1;
else EXP_MISSING = 0;
/*for outcome missing*/
if DMFT_CAT = . then OUT_MISSING = 1;
else OUT_MISSING = 0;
/*for exposure and outcome missing*/
if DIAB_STATUS = . or DMFT_CAT = .  then EXP_OUT_MISSING = 1;
else EXP_OUT_MISSING = 0;

/*For any missing values*/
if EXP_OUT_MISSING = 1 or
AGE_CAT = . or
EDUCATION = . or
SEX = . or
RACE = . or
SMOKING_STATUS = . or
BODY_WEIGHT = . or
RATIO_INC_POV = . or
DENTAL_VISIT = . 
then MISS_ANY = 1;else MISS_ANY = 0;
run;

/*Frequencies of indicator variables*/
proc freq data=FINAL.FINAL_MISSING;
where age_exclude=0;
table MISS_ANY EXP_OUT_MISSING OUT_MISSING EXP_MISSING;
run;

/*Creating a new dataset by including only complete cases and excluding those with any missing values*/
data FINAL.FINAL_NO_MISSING; /* N = 14997 (complete cases) and participants under 25*/  
set  FINAL.FINAL_MISSING;  /*N=35706: if excluding people under 25 then N=19083*/
	where MISS_ANY=0 and age_exclude=0; 
run;

/*Frequencies of exposure and outcome variables in the complete case dataset*/
proc freq data=FINAL.FINAL_NO_MISSING;
table DIAB_STATUS DIAB_CONTROL DMFT_CAT EDUCATION RACE AGE_CAT SEX SMOKING_STATUS BODY_WEIGHT DENTAL_VISIT  RATIO_INC_POV;
run;

/*Creating a new dataset by including only complete cases and excluding those with any missing values*/
data FINAL.FINAL_NON_COMPLETE; /* N = 4086 (non-complete cases) and participants over 25*/  
set  FINAL.FINAL_MISSING;  /*N=19083, if excluding people under 25. If not then N=35706*/ 
	where MISS_ANY=1 and age_exclude=0; 
run;

/*****************************************************
 *                   Descriptive Analysis            *            
 *****************************************************/  
/*****************************************************************
 *     Frequency Tables for all categorical variables and        *                                        
 *     their weighted percentages among the US population        *                                            
 *                                                               *                                              
 *****************************************************************/
/*Overall*/
proc surveyfreq data=FINAL.FINAL_MISSING;
strata SDMVSTRA; 
cluster SDMVPSU;
weight WTMEC7YR;
where age_exclude=0 and MISS_ANY=0;
tables DIAB_STATUS DIAB_CONTROL DMFT_CAT AGE_CAT EDUCATION SEX RACE SMOKING_STATUS BODY_WEIGHT RATIO_INC_POV DENTAL_VISIT ;
title "Overall";
run;

/*In the DIABETES category*/
proc surveyfreq data=FINAL.FINAL_MISSING;
strata SDMVSTRA; 
cluster SDMVPSU; 
weight WTMEC7YR;
where DIAB_STATUS = 1 and age_exclude=0 and MISS_ANY=0;
tables DIAB_CONTROL DMFT_CAT AGE_CAT EDUCATION SEX RACE SMOKING_STATUS BODY_WEIGHT RATIO_INC_POV DENTAL_VISIT ;
title "DIABETES category";
run;

/*In the PREDIABETES category*/
proc surveyfreq data=FINAL.FINAL_MISSING;
strata SDMVSTRA; 
cluster SDMVPSU; 
weight WTMEC7YR;
where DIAB_STATUS = 2 and age_exclude=0 and MISS_ANY=0;
tables DIAB_CONTROL DMFT_CAT AGE_CAT EDUCATION SEX RACE SMOKING_STATUS BODY_WEIGHT RATIO_INC_POV DENTAL_VISIT ;
title "PREDIABETES category";
run;

/*In the NO DIABETES category*/
proc surveyfreq data=FINAL.FINAL_MISSING;
strata SDMVSTRA; 
cluster SDMVPSU; 
weight WTMEC7YR;
where DIAB_STATUS = 3 and age_exclude=0 and MISS_ANY=0;
tables DIAB_CONTROL DMFT_CAT AGE_CAT EDUCATION SEX RACE SMOKING_STATUS BODY_WEIGHT RATIO_INC_POV DENTAL_VISIT ;
title "NO DIABETES category";
run;

/*Chisquare tests*/
proc surveyfreq data=FINAL.FINAL_MISSING;
strata SDMVSTRA; 
cluster SDMVPSU; 
weight WTMEC7YR;
where age_exclude=0 and MISS_ANY=0;
tables  DMFT_CAT*DIAB_STATUS AGE_CAT*DIAB_STATUS EDUCATION*DIAB_STATUS SEX*DIAB_STATUS RACE*DIAB_STATUS 
SMOKING_STATUS*DIAB_STATUS BODY_WEIGHT*DIAB_STATUS RATIO_INC_POV*DIAB_STATUS DENTAL_VISIT*DIAB_STATUS / chisq col ;
title "Chisquare tests";
run;

/*****************************************************************
 *     Weighted Average values for all                           *
 *     continuous variables among the US population              *                                            
 *                                                               *                                              
 *****************************************************************/

/*Average values and SE for continuous variables Overall*/
proc surveymeans data=FINAL.FINAL_MISSING;
strata SDMVSTRA; 
cluster SDMVPSU; 
weight WTMEC7YR;
domain age_exclude*MISS_ANY; 
var RIDAGEYR DMFT;
title "Overall";
run;

/*Alternative way*/
proc surveymeans data=FINAL.FINAL_MISSING;
strata SDMVSTRA; 
cluster SDMVPSU; 
weight WTMEC7YR;
where age_exclude=0 and MISS_ANY=0;
var RIDAGEYR DMFT;
title "Overall";
run;

/*Average values and SE for continuous variables in Diabetes group */
proc surveymeans data=FINAL.FINAL_MISSING;
where DIAB_STATUS = 1; 
strata SDMVSTRA; 
cluster SDMVPSU; 
weight WTMEC7YR;
domain age_exclude*MISS_ANY; 
var RIDAGEYR DMFT;
title "Diabetes group";
run;

/*Alternative way */
proc surveymeans data=FINAL.FINAL_MISSING;
where DIAB_STATUS = 1 and age_exclude=0 and MISS_ANY=0; 
strata SDMVSTRA; 
cluster SDMVPSU; 
weight WTMEC7YR;
var RIDAGEYR DMFT;
title "Diabetes group";
run;

/*Average values and SE for continuous variables in Prediabetes group*/
proc surveymeans data=FINAL.FINAL_MISSING;
where DIAB_STATUS = 2; 
strata SDMVSTRA; 
cluster SDMVPSU; 
weight WTMEC7YR;
domain age_exclude*MISS_ANY; 
var RIDAGEYR DMFT;
title "Prediabetes group";
run;

/*Alternative way */
proc surveymeans data=FINAL.FINAL_MISSING;
where DIAB_STATUS = 2 and age_exclude=0 and MISS_ANY=0; 
strata SDMVSTRA; 
cluster SDMVPSU; 
weight WTMEC7YR;
var RIDAGEYR DMFT;
title "Prediabetes  group";
run;

/*Average values and SE for continuous variables in No diabetes group */
proc surveymeans data=FINAL.FINAL_MISSING;
where DIAB_STATUS = 3; 
strata SDMVSTRA; 
cluster SDMVPSU; 
weight WTMEC7YR;
domain age_exclude*MISS_ANY; 
var RIDAGEYR DMFT;
title "No diabetes  group";
run;
/* Alternative way */
proc surveymeans data=FINAL.FINAL_MISSING;
where DIAB_STATUS = 3 and age_exclude=0 and MISS_ANY=0; 
strata SDMVSTRA; 
cluster SDMVPSU; 
weight WTMEC7YR;
var RIDAGEYR DMFT;
title "No diabetes  group";
run;




/*ANOVA test comparing differences in age across 3 Diabetes groups*/
proc glm data=FINAL.FINAL_MISSING;
class DIAB_STATUS;
model RIDAGEYR = DIAB_STATUS;
where age_exclude=0 and MISS_ANY=0;
title "ANOVA for RIDAGEYR by DIAB_STATUS";
run;

/*ANOVA for Age by DIAB_STATUS with Survey weights*/
proc surveyreg data=FINAL.FINAL_MISSING;
class DIAB_STATUS;
where age_exclude=0 and MISS_ANY=0;
model RIDAGEYR = DIAB_STATUS;
title "ANOVA for RIDAGEYR by DIAB_STATUS with Survey Weight";
weight WTMEC7YR;
strata SDMVSTRA;
cluster SDMVPSU;
run;

/*ANOVA test comparing differences in DMFT across 3 Diabetes groups*/
proc glm data=FINAL.FINAL_MISSING;
class DIAB_STATUS;
model DMFT = DIAB_STATUS;
where age_exclude=0 and MISS_ANY=0;
title "ANOVA for DMFT by DIAB_STATUS";
run;
/*ANOVA for DMFT by DIAB_STATUS with Survey weights*/
proc surveyreg data=FINAL.FINAL_MISSING;
class DIAB_STATUS;
where age_exclude=0 and MISS_ANY=0;
model DMFT  = DIAB_STATUS;
title "ANOVA for DMFT by DIAB_STATUS with Survey Design Features";
weight WTMEC7YR;
strata SDMVSTRA;
cluster SDMVPSU;
run;

/*****************************************************
 *    Analysis using DMFT as categorical             *                                         
 *****************************************************/

/*****************************************************
 *          First research question                  *         
 *****************************************************/
/*****************************************************
 *  Robust Poisson models for binary outcome         *        
 *****************************************************/ 


/*Progressive Adjustment for the relationship between Diabetes and Caries*/
/*Model 0 - Unadjusted (Crude)*/

proc genmod data=FINAL.FINAL_MISSING;
where age_exclude=0 and MISS_ANY=0;
class SEQN DIAB_STATUS (ref="No diabates");
model DMFT_CAT = DIAB_STATUS/ dist=poisson link=log; 
weight WTMEC7YR;
repeated subject=SEQN/type=unstr;
estimate 'PR Diabetes vs No Diabetes' DIAB_STATUS 1 0 -1 / exp;
estimate 'PR Prediabetes vs No Diabetes' DIAB_STATUS 0 1 -1 / exp;
output out=preds p=pred l=lower u=upper;
title "Unadjusted model";
run;


/*Model 1 - Adjusted for age and gender */
proc genmod data=FINAL.FINAL_MISSING;
where age_exclude=0 and MISS_ANY=0;
class SEQN DIAB_STATUS (ref="No diabates")AGE_CAT SEX;
model DMFT_CAT = DIAB_STATUS AGE_CAT SEX/ dist=poisson link=log; 
weight WTMEC7YR;
repeated subject=SEQN/type=unstr;
estimate 'PR Diabetes vs No Diabetes' DIAB_STATUS 1 0 -1 / exp;
estimate 'PR Prediabetes vs No Diabetes' DIAB_STATUS 0 1 -1 / exp;
output out=preds p=pred l=lower u=upper;
title "Model 1 - Adjusted for age and gender";
run;


/*Model 2 - Adjusted for model 1 + Race, Family income to poverty and education */
proc genmod data=FINAL.FINAL_MISSING;
where age_exclude=0 and MISS_ANY=0;
class SEQN DIAB_STATUS (ref="No diabates")AGE_CAT SEX RACE RATIO_INC_POV EDUCATION;
model DMFT_CAT = DIAB_STATUS AGE_CAT SEX RACE RATIO_INC_POV EDUCATION / dist=poisson link=log; 
weight WTMEC7YR;
repeated subject=SEQN/type=unstr;
estimate 'PR Diabetes vs No Diabetes' DIAB_STATUS 1 0 -1 / exp;
estimate 'PR Prediabetes vs No Diabetes' DIAB_STATUS 0 1 -1 / exp;
output out=preds p=pred l=lower u=upper;
title "Model 2 - Adjusted for model 1 + Race, Family income to poverty and education";
run; 

/*Model 3 - Adjusted for model 2 + smoking status, body weight and last dental visit */
proc genmod data=FINAL.FINAL_MISSING;
where age_exclude=0 and MISS_ANY=0;
class SEQN DIAB_STATUS (ref="No diabates")AGE_CAT SEX RACE RATIO_INC_POV EDUCATION SMOKING_STATUS BODY_WEIGHT DENTAL_VISIT;
model DMFT_CAT = DIAB_STATUS AGE_CAT SEX RACE RATIO_INC_POV EDUCATION SMOKING_STATUS BODY_WEIGHT DENTAL_VISIT/ dist=poisson link=log; 
weight WTMEC7YR;
repeated subject=SEQN/type=unstr;
estimate 'PR Diabetes vs No Diabetes' DIAB_STATUS 1 0 -1 / exp;
estimate 'PR Prediabetes vs No Diabetes' DIAB_STATUS 0 1 -1 / exp;
output out=preds p=pred l=lower u=upper;
title "Model 3 - Adjusted for model 2 + smoking status, body weight and last dental visit ";
run; 

/*****************************************************
 *            Second research question               *         
 *****************************************************/                                                    
/*****************************************************
 *  Robust Poisson models for binary outcome         *        
 *****************************************************/ 

/*Progressive Adjustment for the relationship between Diabetes Control and Caries*/
/*Model 0 - Unadjusted (Crude)*/

proc genmod data=FINAL.FINAL_MISSING descending;
where DIAB_STATUS = 1 and age_exclude=0 and MISS_ANY=0;
class SEQN DIAB_CONTROL (ref="Good");
model DMFT_CAT = DIAB_CONTROL/ dist=poisson link=log; 
weight WTMEC7YR;
repeated subject=SEQN/type=unstr;
estimate 'PR Poor vs Good' DIAB_CONTROL 0 1 -1 / exp;
estimate 'PR Moderate vs Good' DIAB_CONTROL 1 0 -1 / exp;
output out=preds p=pred l=lower u=upper;
title "Unadjusted model";
run;

/*Model 1 - Adjusted for age and gender */
proc genmod data=FINAL.FINAL_MISSING;
where DIAB_STATUS = 1 and age_exclude=0 and MISS_ANY=0;
class SEQN DIAB_CONTROL (ref="Good")AGE_CAT SEX;
model DMFT_CAT = DIAB_CONTROL AGE_CAT SEX/ dist=poisson link=log; 
weight WTMEC7YR;
repeated subject=SEQN/type=unstr;
estimate 'PR Poor vs Good' DIAB_CONTROL 0 1 -1 / exp;
estimate 'PR Moderate vs Good' DIAB_CONTROL 1 0 -1 / exp;
output out=preds p=pred l=lower u=upper;
title "Model 1 - Adjusted for age and gender";
run;


/*Model 2 - Adjusted for model 1 + Race, Family income to poverty and education */
proc genmod data=FINAL.FINAL_MISSING;
where DIAB_STATUS = 1 and age_exclude=0 and MISS_ANY=0;
class SEQN DIAB_CONTROL (ref="Good")AGE_CAT SEX RACE RATIO_INC_POV EDUCATION;
model DMFT_CAT = DIAB_CONTROL AGE_CAT SEX RACE RATIO_INC_POV EDUCATION / dist=poisson link=log; 
weight WTMEC7YR;
repeated subject=SEQN/type=unstr;
estimate 'PR Poor vs Good' DIAB_CONTROL 0 1 -1 / exp;
estimate 'PR Moderate vs Good' DIAB_CONTROL 1 0 -1 / exp;
output out=preds p=pred l=lower u=upper;
title "Model 2 - Adjusted for model 1 + Race, Family income to poverty and education";
run; 

/*Model 3 - Adjusted for model 2 + smoking status, body weight and last dental visit */
proc genmod data=FINAL.FINAL_MISSING;
where DIAB_STATUS = 1 and age_exclude=0 and MISS_ANY=0;
class SEQN DIAB_CONTROL (ref="Good")AGE_CAT SEX RACE RATIO_INC_POV EDUCATION SMOKING_STATUS BODY_WEIGHT DENTAL_VISIT;
model DMFT_CAT = DIAB_CONTROL AGE_CAT SEX RACE RATIO_INC_POV EDUCATION SMOKING_STATUS BODY_WEIGHT DENTAL_VISIT/ dist=poisson link=log; 
weight WTMEC7YR;
repeated subject=SEQN/type=unstr;
estimate 'PR Poor vs Good' DIAB_CONTROL 0 1 -1 / exp;
estimate 'PR Moderate vs Good' DIAB_CONTROL 1 0 -1 / exp;
output out=preds p=pred l=lower u=upper;
title "Model 3 - Adjusted for model 2 + smoking status, body weight and last dental visit ";
run; 


/*****************************************************
 *          Third research question                  *         
 *****************************************************/
/*****************************************************
 *  Robust Poisson models for binary outcome         *        
 *****************************************************/ 
/*Model 3 - Fully adjusted model with an ineraction term to test the interaction hypothesis*/
proc genmod data=FINAL.FINAL_MISSING;
where age_exclude=0 and MISS_ANY=0;
class SEQN DIAB_STATUS (ref="No diabates")AGE_CAT SEX RACE RATIO_INC_POV EDUCATION (ref="Some college or more") SMOKING_STATUS BODY_WEIGHT DENTAL_VISIT/param=ref;
model DMFT_CAT = DIAB_STATUS AGE_CAT SEX RACE RATIO_INC_POV SMOKING_STATUS BODY_WEIGHT DENTAL_VISIT EDUCATION EDUCATION*DIAB_STATUS/ dist=poisson link=log; 
weight WTMEC7YR;
repeated subject=SEQN/type=unstr;
estimate 'Diabetes vs No diabetes in HS or less' DIAB_STATUS 1 0 -1
                  EDUCATION*DIAB_STATUS 1 0 -1 0 0 0 / exp;
estimate 'Prediabetes vs No diabetes in HS or less' DIAB_STATUS 0 1 -1
                  EDUCATION*DIAB_STATUS 0 1 -1 0 0 0 / exp;
estimate 'Diabetes vs No diabetes in Some college or more' DIAB_STATUS 1 0 -1 
                  EDUCATION*DIAB_STATUS 0 0 0 1 0 -1  / exp;
estimate 'Prediabetes vs No diabetes in Some college or more' DIAB_STATUS 0 1 -1 
                  EDUCATION*DIAB_STATUS 0 0 0 0 1 -1  / exp;
 
output out=preds p=pred l=lower u=upper;
title "Model 3 - Adjusted for model 2 + smoking status, body weight and last dental visit";
run; 


/*****************************************************
 *    Analysis using DMFT as continuous              *                                         
 *****************************************************/

/*****************************************************
 *          First research question                  *         
 *****************************************************/ 
/*****************************************************
 *         Poisson Models with the Dispersion        *
 *          Parameter for Continuous Outcome         *        
 *****************************************************/

/*Progressive Adjustment for the relationship between Diabetes and Caries*/
/*Model 0 - Unadjusted (Crude)*/
proc genmod data=FINAL.FINAL_MISSING;
where age_exclude=0 and MISS_ANY=0;
class DIAB_STATUS (ref="No diabates");
model DMFT = DIAB_STATUS/ dscale dist=poisson link=log type3;  
weight WTMEC7YR;
estimate 'PR Diabetes vs No Diabetes' DIAB_STATUS 1 0 -1 / exp;
estimate 'PR Prediabetes vs No Diabetes' DIAB_STATUS 0 1 -1 / exp;
title "Unadjusted model";
run;

/*Model 1 - Adjusted for age and gender */
proc genmod data=FINAL.FINAL_MISSING;
where age_exclude=0 and MISS_ANY=0;
class DIAB_STATUS (ref="No diabates")AGE_CAT SEX;
model DMFT = DIAB_STATUS AGE_CAT SEX/ dscale dist=poisson link=log type3;  
weight WTMEC7YR;
estimate 'PR Diabetes vs No Diabetes' DIAB_STATUS 1 0 -1 / exp;
estimate 'PR Prediabetes vs No Diabetes' DIAB_STATUS 0 1 -1 / exp;
title "Model 1 - Adjusted for age and gender";
run;

/*Model 2 - Adjusted for model 1 + Race, Family income to poverty and education */
proc genmod data=FINAL.FINAL_MISSING;
where age_exclude=0 and MISS_ANY=0;
class DIAB_STATUS (ref="No diabates")AGE_CAT SEX RACE RATIO_INC_POV EDUCATION;
model DMFT = DIAB_STATUS AGE_CAT SEX RACE RATIO_INC_POV EDUCATION / dscale dist=poisson link=log type3;  
weight WTMEC7YR;
estimate 'PR Diabetes vs No Diabetes' DIAB_STATUS 1 0 -1 / exp;
estimate 'PR Prediabetes vs No Diabetes' DIAB_STATUS 0 1 -1 / exp;
title "Model 2 - Adjusted for model 1 + Race, Family income to poverty and education";
run; 

/*Model 3 - Adjusted for model 2 + smoking status, body weight and last dental visit */
proc genmod data=FINAL.FINAL_MISSING;
where age_exclude=0 and MISS_ANY=0;
class DIAB_STATUS (ref="No diabates")AGE_CAT SEX RACE RATIO_INC_POV EDUCATION SMOKING_STATUS BODY_WEIGHT DENTAL_VISIT;
model DMFT = DIAB_STATUS AGE_CAT SEX RACE RATIO_INC_POV EDUCATION SMOKING_STATUS BODY_WEIGHT DENTAL_VISIT/ dscale dist=poisson link=log type3; 
weight WTMEC7YR;
estimate 'PR Diabetes vs No Diabetes' DIAB_STATUS 1 0 -1 / exp;
estimate 'PR Prediabetes vs No Diabetes' DIAB_STATUS 0 1 -1 / exp;
title "Model 3 - Adjusted for model 2 + smoking status, body weight and last dental visit ";
run; 

/*****************************************************
 *            Second research question               *         
 *****************************************************/  
/*****************************************************
 *         Poisson Models with the Dispersion        *
 *          Parameter for Continuous Outcome         *        
 *****************************************************/

/*Progressive Adjustment for the relationship between Diabetes Control and Caries*/
/*Model 0 - Unadjusted (Crude)*/

proc genmod data=FINAL.FINAL_MISSING;
where DIAB_STATUS = 1 and age_exclude=0 and MISS_ANY=0;
class DIAB_CONTROL (ref="Good");
model DMFT = DIAB_CONTROL / dscale dist=poisson link=log type3;  
weight WTMEC7YR;
estimate 'PR Poor vs Good' DIAB_CONTROL 0 1 -1 / exp;
estimate 'PR Moderate vs Good' DIAB_CONTROL 1 0 -1 / exp;
title "Unadjusted model";
run;

/*Model 1 - Adjusted for age and gender */

proc genmod data=FINAL.FINAL_MISSING;
where DIAB_STATUS = 1 and age_exclude=0 and MISS_ANY=0;
class DIAB_CONTROL (ref="Good") AGE_CAT SEX;
model DMFT = DIAB_CONTROL AGE_CAT SEX/ dscale dist=poisson link=log type3;  
weight WTMEC7YR;
estimate 'PR Poor vs Good' DIAB_CONTROL 0 1 -1 / exp;
estimate 'PR Moderate vs Good' DIAB_CONTROL 1 0 -1 / exp;
title "Model 1 - Adjusted for age and gender";
run;

/*Model 2 - Adjusted for model 1 + Race, Family income to poverty and education */

proc genmod data=FINAL.FINAL_MISSING;
where DIAB_STATUS = 1 and age_exclude=0 and MISS_ANY=0;
class DIAB_CONTROL(ref="Good")AGE_CAT SEX RACE RATIO_INC_POV EDUCATION;
model DMFT = DIAB_CONTROL AGE_CAT SEX RACE RATIO_INC_POV EDUCATION / dscale dist=poisson link=log type3;  
weight WTMEC7YR;
estimate 'PR Poor vs Good' DIAB_CONTROL 0 1 -1 / exp;
estimate 'PR Moderate vs Good' DIAB_CONTROL 1 0 -1 / exp;
title "Model 2 - Adjusted for model 1 + Race, Family income to poverty and education";
run; 

/*Model 3 - Adjusted for model 2 + smoking status, body weight and last dental visit */

proc genmod data=FINAL.FINAL_MISSING;
where DIAB_STATUS = 1 and age_exclude=0 and MISS_ANY=0;
class DIAB_CONTROL (ref="Good")AGE_CAT SEX RACE RATIO_INC_POV EDUCATION SMOKING_STATUS BODY_WEIGHT DENTAL_VISIT;
model DMFT = DIAB_CONTROL AGE_CAT SEX RACE RATIO_INC_POV EDUCATION SMOKING_STATUS BODY_WEIGHT DENTAL_VISIT/ dscale dist=poisson link=log type3; 
weight WTMEC7YR;
estimate 'PR Poor vs Good' DIAB_CONTROL 0 1 -1 / exp;
estimate 'PR Moderate vs Good' DIAB_CONTROL 1 0 -1 / exp;
title "Model 3 - Adjusted for model 2 + smoking status, body weight and last dental visit ";
run; 


/*****************************************************
 *          Third research question                  *         
 *****************************************************/

/*****************************************************
 *         Interaction Poisson Model with the        *
 *  Dispersion Parameter for Continuous Outcome      *        
 *****************************************************/
/*Model 3 - Fully adjusted model with an ineraction term to test the interaction hypothesis*/
proc genmod data=FINAL.FINAL_MISSING;
where age_exclude=0 and MISS_ANY=0;
class DIAB_STATUS (ref="No diabates")AGE_CAT SEX RACE RATIO_INC_POV EDUCATION (ref="Some college or more") SMOKING_STATUS BODY_WEIGHT DENTAL_VISIT/param=ref;
model DMFT = DIAB_STATUS AGE_CAT SEX RACE RATIO_INC_POV SMOKING_STATUS BODY_WEIGHT DENTAL_VISIT EDUCATION EDUCATION*DIAB_STATUS/ dscale dist=poisson link=log; 
weight WTMEC7YR;
estimate 'Diabetes vs No diabetes in HS or less' DIAB_STATUS 1 0 -1
                  EDUCATION*DIAB_STATUS 1 0 -1 0 0 0 / exp;
estimate 'Prediabetes vs No diabetes in HS or less' DIAB_STATUS 0 1 -1
                  EDUCATION*DIAB_STATUS 0 1 -1 0 0 0 / exp;
estimate 'Diabetes vs No diabetes in Some college or more' DIAB_STATUS 1 0 -1 
                  EDUCATION*DIAB_STATUS 0 0 0 1 0 -1  / exp;
estimate 'Prediabetes vs No diabetes in Some college or more' DIAB_STATUS 0 1 -1 
                  EDUCATION*DIAB_STATUS 0 0 0 0 1 -1  / exp;
title "Model 3 - Adjusted for model 2 + smoking status, body weight and last dental visit";
run; 


/**********************************************************
*      COMPARISON OF COMPLETE AND NON-COMPLETE CASES      *
***********************************************************/

/*Using Chi-Square to test whether the differences between complete and non-complete cases 
are significant with respect to covariates*/
proc freq data=FINAL.FINAL_MISSING;
where age_exclude = 0;
tables RACE*MISS_ANY SEX*MISS_ANY AGE_CAT*MISS_ANY RATIO_INC_POV*MISS_ANY EDUCATION*MISS_ANY 
SMOKING_STATUS*MISS_ANY BODY_WEIGHT*MISS_ANY DENTAL_VISIT*MISS_ANY DIAB_STATUS*MISS_ANY DMFT_CAT*MISS_ANY/chisq;
title "Comparing complete cases with non-complete cases";
run;


































/*Frequencies of non-complete cases without missing values./* 
/*Excluding missing from the missing variables among non-complete and running frequencies to 
compare their distribution of categories against the complete cases */
proc freq data=FINAL.FINAL_NON_COMPLETE;
table DMFT_CAT;
run;
proc freq data=FINAL.FINAL_NON_COMPLETE;
table DIAB_STATUS;
run;
proc freq data=FINAL.FINAL_NO_MISSING;
table DIAB_STATUS;
run;
proc freq data=FINAL.FINAL_NON_COMPLETE;
where EDUCATION ne 3;
table EDUCATION;
run;
proc freq data=FINAL.FINAL_NON_COMPLETE;
where SMOKING_STATUS ne 4;
table SMOKING_STATUS;
run;
proc freq data=FINAL.FINAL_NON_COMPLETE;
where RATIO_INC_POV ne 5;
table RATIO_INC_POV;
run;
proc freq data=FINAL.FINAL_NON_COMPLETE;
where BODY_WEIGHT ne 5;
table BODY_WEIGHT;
run;
proc freq data=FINAL.FINAL_NON_COMPLETE;
where DENTAL_VISIT ne 5;
table DENTAL_VISIT;
run;



/* Creating a dataset to visualize Odds Ratios from the interaction model*/
data odds_ratios_interaction;
input EDUCATION $ DIAB_STATUS $20. odds_ratio;
datalines;
1     Diabetes         1.088 
1     Prediabetes      0.961
2     Diabetes         1.05 
2     Prediabetes      0.98 
;

run;

options linesize=100;

/*Renaming education categories with their actual names to display on graph*/
data odds_ratios_interaction;
set odds_ratios_interaction;
if EDUCATION = 1 then EDUCATION_ = "HS or Less";
else EDUCATION_ = "College or more"; 
format EDUCATION_ $20.;
run; 
/*Plotting Odds Ratios from interaction model*/
proc sgplot data=odds_ratios_interaction;
  scatter x=EDUCATION_ y=odds_ratio / 
          group=DIAB_STATUS datalabel=odds_ratio
          datalabelpos=right datalabelattrs=(size=10) 
          markerattrs=(symbol=circlefilled);
  refline 1 / axis=y;
 xaxis  display=(nolabel);  
  yaxis label='Odds Ratio' values=(0.5 to 1.5 by 0.1);
  title 'Odds Ratios of Diabetes and Prediabetes vs No Diabetes across Education levels';
  keylegend / title='Diabetes Status';
  xaxis offsetmax=0.3 offsetmin=0.3 discreteorder=data;
run;

/* Creating a dataset to visualize Odds Ratios from the stratified model*/
data odds_ratios_stratified;
input EDUCATION $ DIAB_STATUS $15. odds_ratio;
datalines;
1   Diabetes       1.203  
1   Prediabetes    1.062 
2   Diabetes       0.986  
2   Prediabetes    0.989  
;
run;


/*Renaming education categories with their actual names to display on graph*/
data odds_ratios_stratified;
set odds_ratios_stratified;
if EDUCATION = 1 then EDUCATION_="High School or Less";
else EDUCATION_ = "College or more";
run; 
/*Plotting Odds Ratios from stratified models*/
proc sgplot data=odds_ratios_stratified;
  scatter x=education_  y=odds_ratio / 
          group=DIAB_STATUS datalabel=odds_ratio
		   datalabelpos=right datalabelattrs=(size=10)
          markerattrs=(symbol=circlefilled)
             jitter;
  refline 1 / axis=y;
  xaxis display=(nolabel);
  yaxis label='Odds Ratio' values=(0.5 to 1.5 by 0.1);
  title 'Odds Ratios of Diabetes and Prediabetes vs No Diabetes stratified by Education';
  keylegend / title='Diabetes Status';
  xaxis offsetmax=0.3 offsetmin=0.3 discreteorder=data;
run;

/*Comparing complete cases with non-complete cases with respect to all covariates*/

proc freq data=FINPR13.FINAL_MISSING;
where age_exclude=0;
tables RACE EDUCATION RATIO_INC_POV SEX AGE_CAT SMOKING_STATUS BODY_WEIGHT DENTAL_VISIT DIAB_STATUS DMFT_CAT;
run;


























data OR_low;
set OR_low;
rename OddsRatioEst = OddsRatioEst_1;
run;
data OR_high;
set OR_high;
rename OddsRatioEst = OddsRatioEst_2 lowerCL = lowerCL_2 upperCL = upperCL_2;
run;

proc sort data=OR_low; by effect; run;
proc sort data=OR_high; by effect; run;
/* Merge the results for low and high education levels */
data OR_both;
    merge OR_Low OR_High ;
	by effect;
run;

data OR_both_final;
set OR_both (where=(Effect in ("DIAB_STATUS    Diabetes    vs No diabates" "DIAB_STATUS    Prediabetes vs No diabates")));
run;

proc sgplot data=OR_both_final;
    scatter x=Effect y=OddsRatioEst_1 / markerattrs=(symbol=circlefilled color=blue);
    scatter x=Effect y=OddsRatioEst_2 / markerattrs=(symbol=circlefilled color=red);
    refline 1 / axis=y lineattrs=(pattern=shortdash color=black);
    xaxis values=("lower education" "higher education") label="Education Level";
    yaxis label='Odds Ratio' values=(0 to 2 by 0.2);
    keylegend / location=inside position=topright across=1;
run;

discreteorder=data


