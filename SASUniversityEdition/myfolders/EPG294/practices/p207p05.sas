**************************************************;
*  LESSON 7, PRACTICE 5                          *;
**************************************************;

proc print data=pg2.np_2016camping(obs=15);
run;

proc transpose data=pg2.np_2016camping out=work.camping2016_t name=location;
	by ParkName;
	id CampType;
	var CampCount;
run;