/*

Determine the name of the common column in the pg2.np_codelookup and pg2.np_2016 tables.
Write a new program to sort the data in both tables by the matching column.
Using a DATA step, merge the pg2.np_codelookup and pg2.np_2016 tables to create 
	two new tables named work.parkStats and work.parkOther.
The work.parkStats table should contain only ParkCode values that are in the np_2016 table, and it should only the ParkCode, ParkName, Year, Month, and DayVisits columns.
The work.parkOther table should contain all other rows, and it should include only the ParkCode and ParkName columns.
Submit the program and examine the output data.

*/

proc sort data=pg2.np_CodeLookup out=sortnames(keep=ParkName ParkCode);
	by ParkCode;
run;

proc sort data=pg2.np_2016 out=sort2016;
	by ParkCode;
run;


data work.parkStats(keep=ParkCode) work.parkOther; 
	merge work.sort2016(in=inA) work.sortnames(in=inB);
	by ParkCode;
	if inA then output work.ParkStats;
	else output work.parkOther;
run;
