***********************************************************;
*  LESSON 5, PRACTICE 3                                   *;
*  a) Submit the two PROC SORT steps. Determine the name  *;
*     of the common column in the sorted tables.          *;
*  b) Modify the second PROC SORT step to use the RENAME= *;
*     option after the PG2.NP_2016TRAFFIC table to rename *;
*     Code to ParkCode. Modify the BY statement to sort   *;
*     by the new column name.                             *;
*  c) Write a DATA step to merge the sorted tables by the *;
*     common column to create a new table,                *;
*     WORK.TRAFFICSTATS. Drop the Name_Code column from   *;
*     the output table.                                   *;
***********************************************************;

proc sort data=pg2.np_codelookup out=work.codesort;
	by ParkCode;
run;

proc sort data=pg2.np_2016traffic(rename=(Code=ParkCode)) out=work.traf2016Sort;
	by ParkCode month;
run;

data work.trafficstats;
	merge work.codesort work.traf2016Sort;
	by ParkCode;
	drop name_code;
run;


proc print data=work.trafficstats;
	where Year = 2016 and Month=1 and ParkName = 'Amistad National Recreation Area';
	format MonthCount Number9.;
	run;