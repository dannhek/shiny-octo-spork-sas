* Practice Quiz - Week 1 Practice Quiz 2.

* Open a new program window and write a DATA step that reads the 
*     pg2.np_2017 table and creates temporary SAS tables named camping and lodging.
* Compute a new column, CampTotal, that is the sum of CampingOther,
*     CampingTent, CampingRV, and CampingBackcountry.
* Format CampTotal so that values are displayed with commas.
* In the camping table, include only rows that have CampTotal greater 
*     than zero.
* The camping table should only have the columns ParkName, Month,
*      DayVisits, and CampTotal columns.
* In the lodging table, include only rows that have LodgingOther 
*     greater than zero.
* The lodging table should only have the columns ParkName, Month,
*      DayVisits, and LodgingOther columns. ;

data camping(keep=ParkName Month DayVisits CampTotal) lodging(keep=ParkName Month DayVisits LodgingOther); 
	set pg2.np_2017;
	format CampTotal comma10.0;
	CampTotal = CampingOther + CampingTent + CampingRV + CampingBackcountry;
	if CampTotal>0 then output camping;
	if LodgingOther>0 then output lodging;

	