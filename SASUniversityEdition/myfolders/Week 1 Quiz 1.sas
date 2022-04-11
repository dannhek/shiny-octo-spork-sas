* Analyzing stat1.normtemp for week 1 quiz on One Sample T-Test;

proc contents data=stat1.normtemp;
run;

proc univariate data=stat1.normtemp;
	var BodyTemp;
	histogram BodyTemp;
run;

proc ttest data=stat1.normtemp h0=98.6 plots()=interval;
	var BodyTemp;
run;
