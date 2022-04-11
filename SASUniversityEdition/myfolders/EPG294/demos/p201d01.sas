**************************************************;
*  Understanding DATA Step Processing            *;
**************************************************;
* Refer to the course notes for detailed steps.  *;
**************************************************;

data storm_complete;
	set pg2.storm_summary_small; 
	length Ocean $ 8;
	drop EndDate;
	where Name is not missing;
	Basin=upcase(Basin);
	StormLength=EndDate-StartDate;
	if substr(Basin,2,1)="I" then Ocean="Indian";
	else if substr(Basin,2,1)="A" then Ocean="Atlantic";
	else Ocean="Pacific";
run;
