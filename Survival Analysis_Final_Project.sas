Libname FINAL "D:\vahan\Documents\Vahan-Personal\Application MPH\Drexel University\Drexel University courses\Second Year\Survival Data Analysis (BST 557)\Final Project";

/**************************************
*     Variable Operationalization     *                   
***************************************/

/*Creating categories for operationalization*/
proc format;
value age
1="=<45"
2="45-60"
3=">60";
value nodes
1= "=<3"
2="4-9"
3=">=10";
value size
1="=<20 mm"
2="21-30 mm"
3=">30 mm";
value er
1=">=20 fmol/mg"
2="<20 fmol/mg";
value pgr
1=">=20 fmol/mg"
2="<20 fmol/mg";
run;

/*Creating a new dataset with operationalized variables*/
data BREAST_1;
set FINAL.BREAST;
/*Creating age categories*/
if age le 45 then age_cat=1;
else if age gt 45 and age le 60 then age_cat=2;
else if age gt 60 then age_cat=3;

/*Creating nodes categories*/
if nodes le 3 then nodes_cat=1;
else if nodes ge 4 and nodes le 9 then nodes_cat=2;
else if nodes ge 10 then nodes_cat=3;
/*Creating tumor size categories*/
if size le 20 then size_cat=1;
else if size ge 21 and size le 30 then size_cat=2;
else if size gt 30 then size_cat=3;
/*Creating estrogen categories*/
if er ge 20 then er_cat=1;
else if er lt 20  then er_cat=2;

/*Creating progesteron categories*/
if pgr ge 20 then pgr_cat=1;
else if pgr lt 20  then pgr_cat=2;

format age_cat age. nodes_cat nodes. size_cat size. er_cat er. pgr_cat pgr.;
run;

/***************************************
*           Descriptive statistics     *
****************************************/

/*Categorical variables */
/*for the treatment group*/
proc freq data=BREAST_1;
where hormon = 1;
table meno grade age_cat nodes_cat size_cat er_cat pgr_cat;
title "treatment group";
run;
/*for the placebo group*/
proc freq data=BREAST_1;
where hormon = 0;
table meno grade age_cat nodes_cat size_cat er_cat pgr_cat;
title "placebo group";
run;

proc univariate data = Breast_1;
var rfstime;
run;

/*ChiSquare Test assessing the bivariate associations between covariates and hormone therapy */
proc freq data= Breast_1;
table age_cat*hormon /chisq;
run;
proc freq data= Breast_1;
table nodes_cat*hormon /chisq;
run;
proc freq data= Breast_1;
table size_cat*hormon /chisq;
run;
proc freq data= Breast_1;
table er_cat*hormon /chisq;
run;
proc freq data= Breast_1;
table meno*hormon /chisq;
run;
proc freq data= Breast_1;
table grade*hormon /chisq;
run;
proc freq data= Breast_1;
table pgr_cat*hormon /chisq;
run;


/*******************************************
 * Graphical approach for PH assumption    *
 *******************************************/

/*For Hormon therapy*/
/*Gaining more control by creating an output dataset that contains the 
survival estimates (called survival) using OUTSURV=*/
proc lifetest data = FINAL.BREAST method = km outsurv = one;
	time rfstime*status(0);
	strata hormon;
	title "KM Curves for hormon therapy";
run;

/*Creating a new dataset that takes the log-log*/
data work.one_new;
set work.one;
lls = -log(-log(survival));
run;

/*Plot the log-log survival curve with the new dataset*/
/*log-log survival curves for therapy against time*/
proc gplot data = work.one_new;
plot lls*rfstime = hormon;
symbol1 interpol=stepLJ h=1 c=blue;
symbol2 interpol=stepLJ h=1 c=red;
title "-log(-log(Survival)) Curves for hormon therapy";
run;

/*For menopausal status*/
/*Gaining more control by creating an output dataset that contains the 
survival estimates (called survival) using OUTSURV=*/
proc lifetest data = FINAL.BREAST method = km outsurv = two;
	time rfstime*status(0);
	strata meno;
	title "KM Curves for menopausal status";
run;

/*Creating a new dataset that takes the log-log*/
data work.two_new;
set work.two;
lls = -log(-log(survival));
run;

/*Plot the log-log survival curve with the new dataset*/
/*log-log survival curves for menopausal status against time*/
proc gplot data = work.two_new;
plot lls*rfstime = meno;
symbol1 interpol=stepLJ h=1 c=blue;
symbol2 interpol=stepLJ h=1 c=red;
title "-log(-log(Survival)) Curves for menopausal status";
run;

/*For tumor grade*/
/*Gaining more control by creating an output dataset that contains the 
survival estimates (called survival) using OUTSURV=*/
proc lifetest data = FINAL.BREAST method = km outsurv = three;
	time rfstime*status(0);
	strata grade;
	title "KM Curves for tumor grade";
run;

/*Creating a new dataset that takes the log-log*/
data work.three_new;
set work.three;
lls = -log(-log(survival));
run;

/*Plot the log-log survival curve with the new dataset*/
/*log-log survival curves for tumor grade against time*/
proc gplot data = work.three_new;
plot lls*rfstime = grade;
symbol1 interpol=stepLJ h=1 c=blue;
symbol2 interpol=stepLJ h=1 c=red;
symbol3 interpol=stepLJ h=1 c=yellow;
title "-log(-log(Survival)) Curves for tumor grade";
run;

/* For age_cat*/
/*Gaining more control by creating an output dataset that contains the 
survival estimates (called survival) using OUTSURV=*/
proc lifetest data = BREAST_1 method = km outsurv = four;
	time rfstime*status(0);
	strata age_cat;
	title "KM Curves for age";
run;

/*Creating a new dataset that takes the log-log*/
data work.four_new;
set work.four;
lls = -log(-log(survival));
run;

/*Plot the log-log survival curve with the new dataset*/
/*log-log survival curves for age against time*/
proc gplot data = work.four_new;
plot lls*rfstime = age_cat;
symbol1 interpol=stepLJ h=1 c=blue;
symbol2 interpol=stepLJ h=1 c=red;
symbol3 interpol=stepLJ h=1 c=yellow;
title "-log(-log(Survival)) Curves for age";
run;

/* For Number of Positive Lymphnodes*/
/*Gaining more control by creating an output dataset that contains the 
survival estimates (called survival) using OUTSURV=*/
proc lifetest data = BREAST_1 method = km outsurv = five;
	time rfstime*status(0);
	strata nodes_cat;
	title "KM Curves for nodes";
run;

/*Creating a new dataset that takes the log-log*/
data work.five_new;
set work.five;
lls = -log(-log(survival));
run;

/*Plot the log-log survival curve with the new dataset*/
/*log-log survival curves for nodes against time*/
proc gplot data = work.five_new;
plot lls*rfstime = nodes_cat;
symbol1 interpol=stepLJ h=1 c=blue;
symbol2 interpol=stepLJ h=1 c=red;
symbol3 interpol=stepLJ h=1 c=yellow;
title "-log(-log(Survival)) Curves for nodes";
run;

/*For Tumor Size*/
/*Gaining more control by creating an output dataset that contains the 
survival estimates (called survival) using OUTSURV=*/
proc lifetest data = BREAST_1 method = km outsurv = six;
	time rfstime*status(0);
	strata size_cat;
	title "KM Curves for tumor size";
run;

/*Creating a new dataset that takes the log-log*/
data work.six_new;
set work.six;
lls = -log(-log(survival));
run;

/*Plot the log-log survival curve with the new dataset*/
/*log-log survival curves for tumor size against time*/
proc gplot data = work.six_new;
plot lls*rfstime = size_cat;
symbol1 interpol=stepLJ h=1 c=blue;
symbol2 interpol=stepLJ h=1 c=red;
symbol3 interpol=stepLJ h=1 c=yellow;
title "-log(-log(Survival)) Curves for tumor size";
run;

/* For Estrogen*/
/*Gaining more control by creating an output dataset that contains the 
survival estimates (called survival) using OUTSURV=*/
proc lifetest data = BREAST_1 method = km outsurv = seven;
	time rfstime*status(0);
	strata er_cat;
	title "KM Curves for estrogen";
run;

/*Creating a new dataset that takes the log-log*/
data work.seven_new;
set work.seven;
lls = -log(-log(survival));
run;

/*Plot the log-log survival curve with the new dataset*/
/*log-log survival curves for estrogen against time*/
proc gplot data = work.seven_new;
plot lls*rfstime = er_cat;
symbol1 interpol=stepLJ h=1 c=blue;
symbol2 interpol=stepLJ h=1 c=red;
title "-log(-log(Survival)) Curves for estrogen";
run;

/* For Progesteron*/
/*Gaining more control by creating an output dataset that contains the 
survival estimates (called survival) using OUTSURV=*/
proc lifetest data = BREAST_1 method = km outsurv = eight;
	time rfstime*status(0);
	strata pgr_cat;
	title "KM Curves for progesteron";
run;

/*Creating a new dataset that takes the log-log*/
data work.eight_new;
set work.eight;
lls = -log(-log(survival));
run;

/*Plot the log-log survival curve with the new dataset*/
/*log-log survival curves for progesteron against time*/
proc gplot data = work.eight_new;
plot lls*rfstime = pgr_cat;
symbol1 interpol=stepLJ h=1 c=blue;
symbol2 interpol=stepLJ h=1 c=red;
title "-log(-log(Survival)) Curves for progesteron";
run;

/**********************************
 * Goodness of Fit (GOF) Test     *
 **********************************/
/*Getting Schoenfeld Residuals*/
proc phreg data = BREAST_1 ;
model rfstime*status(0) = hormon meno grade age_cat nodes_cat size_cat er_cat pgr_cat;
output out = resid ressch = rhormon rage_cat rmeno rsize_cat rgrade rnodes_cat rpgr_cat rer_cat;; /*obtaining the Schoenfeld residuals for hormon, age, meno, size, grade, nodes, pgr and er*/
title "Cox PH model for hormon, age, meno, size, grade, nodes, pgr and er";
run;

/*Creating a dataset to delete censored obs*/
data events;
set resid;
where status = 1;
title "Deleting censored obs";
run;

/*Creating a dataset containing the ranked failure times*/
proc rank data = events out = ranked ties = mean;
var rfstime;
ranks timerank; /* variable name is "timerank"*/
title "Ranking the failure times";
run;
/*Obtaining correlations between the ranked failure times and the Schoenfield residuals of all variables*/
proc corr data=ranked nosimple;
var rhormon rage_cat rmeno rsize_cat rgrade rnodes_cat rpgr_cat rer_cat;
with timerank;
title "Testing the correlation";
run;

/***************************************
*    Semiparametric models (Cox PH)    *
****************************************/

/*COX PH model including all covariates*/
proc phreg data = BREAST_1;
class meno er_cat pgr_cat age_cat nodes_cat size_cat grade;
model rfstime*status(0) = hormon meno grade age_cat nodes_cat size_cat er_cat pgr_cat / rl ;
title "Cox PH Model with hormon age meno size grade nodes pgr er";
run;

/*COX PH model unadjusted*/
proc phreg data = BREAST_1;
model rfstime*status(0) = hormon / rl ;
title "Cox PH Model with hormon ";
run;
/*Creating dummy variables for age and size that will be included as time-dependent*/
data BREAST_1;
set BREAST_1;
if age_cat = 1 then Z1_age = 1; else Z1_age = 0;
if age_cat = 2 then Z2_age = 1; else Z2_age = 0;
 
if size_cat = 1 then Z1_size = 1; else Z1_size = 0;
if size_cat = 2 then Z2_size = 1; else Z2_size = 0;
run;
/*Extended Cox model, using g(t) = t for tumor size , menopausal status, age, progesterone and estrogen levels adjusted for others (already assumed to satisfy PH assumption)*/
proc phreg data =  BREAST_1;
class meno er_cat pgr_cat age_cat nodes_cat size_cat grade;
model rfstime*status(0) = hormon age_cat meno size_cat grade nodes_cat pgr_cat er_cat t_meno t_pgr_cat t_er_cat t_Z1_age t_Z2_age t_Z1_size t_Z2_size / rl;
t_Z1_age = Z1_age*rfstime;
t_Z2_age = Z2_age*rfstime;
t_Z1_size = Z1_size*rfstime;
t_Z2_size = Z2_size*rfstime;
t_meno = meno*rfstime;
t_pgr_cat = pgr_cat*rfstime;
t_er_cat = er_cat*rfstime;
title "Extended Cox model, using g(t) = t for age, tumor size , menopausal status, progesterone and estrogen levels adjusted for others (already assumed to satisfy PH assumption)";
run;

/*Extended Cox model, using g(t) = t for tumor size , menopausal status, age, progesterone and estrogen levels adjusted for others (already assumed to satisfy PH assumption)*/
proc phreg data =  BREAST_1;
class meno er_cat pgr_cat age_cat nodes_cat size_cat grade;
model rfstime*status(0) = hormon age_cat meno size_cat grade nodes_cat pgr_cat er_cat t_meno t_pgr_cat t_er_cat t_Z1_age t_Z2_age t_Z1_size t_Z2_size / selection=backward;
t_Z1_age = Z1_age*rfstime;
t_Z2_age = Z2_age*rfstime;
t_Z1_size = Z1_size*rfstime;
t_Z2_size = Z2_size*rfstime;
t_meno = meno*rfstime;
t_pgr_cat = pgr_cat*rfstime;
t_er_cat = er_cat*rfstime;
title "Extended Cox model, using g(t) = t for age, tumor size , menopausal status, progesterone and estrogen levels adjusted for others (already assumed to satisfy PH assumption)";
run;

/*Final Cox PH model*/
proc phreg data = BREAST_1;
class meno er_cat pgr_cat age_cat nodes_cat size_cat grade;
model rfstime*status(0) = hormon meno grade age_cat nodes_cat size_cat er_cat pgr_cat / rl ;
title "Cox PH Model with hormon age meno size grade nodes pgr er";
run;

/****************************************************
 *    Evaluating the  AFT and Weibull ASSUMPTIONS   *
 ****************************************************/

 /* For Hormon Therapy*/
proc lifetest data = BREAST_1  method = km plots = (lls);
time rfstime * status (0);
strata hormon;
title "Log-log Survival Plots";
run;


/*For Age*/
proc lifetest data = BREAST_1  method = km plots = (lls);
time rfstime * status (0);
strata age_cat;
title "Log-log Survival Plots";
run;

/* For tumor size*/
proc lifetest data = BREAST_1  method = km plots = (lls);
time rfstime * status (0);
strata size_cat;
title "Log-log Survival Plots";
run;

/*For Menopausal Status*/
proc lifetest data = BREAST_1  method = km plots = (lls);
time rfstime * status (0);
strata meno;
title "Log-log Survival Plots";
run;


/*For Tumor Grade*/
proc lifetest data = BREAST_1  method = km plots = (lls);
time rfstime * status (0);
strata grade;
title "Log-log Survival Plots";
run;


/*For Number of Positive Lymphnodes*/
proc lifetest data = BREAST_1  method = km plots = (lls);
time rfstime * status (0);
strata nodes_cat;
title "Log-log Survival Plots";
run;


/*For Progesteron*/
proc lifetest data = BREAST_1  method = km plots = (lls);
time rfstime * status (0);
strata pgr_cat;
title "Log-log Survival Plots";
run;


/*For Estrogen*/
proc lifetest data = BREAST_1  method = km plots = (lls);
time rfstime * status (0);
strata er_cat;
title "Log-log Survival Plots";
run;

/*Parametric Models*/
/*Exponential model*/
proc lifereg data = BREAST_1;
class age_cat meno size_cat grade nodes_cat pgr_cat er_cat;
model rfstime*status(0)=hormon age_cat meno size_cat grade nodes_cat pgr_cat er_cat / dist = exponential;
title "Exponential Survival Model";
run;
/*Unudjusted Weibull model*/
proc lifereg data = BREAST_1;
model rfstime*status(0)=hormon  / dist = Weibull;
title "Weibull Survival Model no adjustment";
run;
/*Adjusted Weibull model*/
proc lifereg data = BREAST_1;
class age_cat meno size_cat grade nodes_cat pgr_cat er_cat;
model rfstime*status(0)=hormon age_cat meno size_cat grade nodes_cat pgr_cat er_cat / dist = Weibull;
title "Weibull Survival Model";
run;

/***************************************
*        Sensitivity Analysis          *
****************************************/
/*extreme scenario: all censored subject have events immediately*/
data Breast_2;
set Breast_1;
if status=0 then status=1;
run;
proc print data= Breast_2;
run;
proc means data= name max;var rfstime;run;
/*Weibull model*/
proc lifereg data = Breast_2;
class age_cat meno size_cat grade nodes_cat pgr_cat er_cat;
model rfstime*status(0) = hormon age_cat meno size_cat grade nodes_cat pgr_cat er_cat / dist=Weibull;
title "Sensitivity anylysis 1 for Cox PH model";
run;







