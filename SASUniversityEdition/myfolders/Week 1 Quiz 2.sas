* Analyzing stat1.german for week 1 quiz on Two Sample T-Test;

proc print data=stat1.german;
run;

proc ttest data=stat1.german plots()=interval;
	class group;
	var change;
run;
