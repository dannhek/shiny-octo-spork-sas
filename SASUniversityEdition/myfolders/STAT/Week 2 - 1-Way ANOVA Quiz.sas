/*
proc print data=stat1.garlic;
run;

proc contents data=stat1.garlic;
run;
*/*;

proc means data=stat1.garlic;
	var BulbWt;
	by Fertilizer;
run;

proc sgplot data=stat1.garlic;
	vbox BulbWt / category = Fertilizer;
	
run;

proc glm data=stat1.garlic;
	class Fertilizer;
	model BulbWt = Fertilizer;
run;



proc glm data=stat1.garlic;
	class Fertilizer;
	model BulbWt = Fertilizer;
	lsmeans Fertilizer / adjust=tukey;
	lsmeans Fertilizer / adjust=dunnet
						 pdiff=controll('4');
run;