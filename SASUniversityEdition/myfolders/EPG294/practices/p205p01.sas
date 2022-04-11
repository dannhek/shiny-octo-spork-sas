***********************************************************;
*  LESSON 5, PRACTICE 1                                   *;
*  a) Complete the SET statement to concatenate the       *;
*     PG2.NP_2015 and PG2.NP_2016 tables to create a new  *;
*     table, NP_COMBINE.                                  *;
*  b) Use a WHERE statement to include only rows where    *;
*     Month is 6, 7, or 8.                                *;
*  c) Create a new column named CampTotal that is the sum *;
*     of CampingOther, CampingTent, CampingRV, and        *;
*     CampingBackcountry. Format the new column with      *;
*     commas.                                             *;
***********************************************************;

data work.np_combine;
    set pg2.np_2015 pg2.NP_2016 pg2.np_2014(rename=(Park=ParkCode Type=ParkType));
    Where Month in (6, 7, 8);
    CampTotal = sum(of Camping:);
    drop Camping:;
    Format CampTotal Comma9.;
run;

proc sort data=work.np_combine;
	by ParkCode;
run;

/*
proc contents data=work.np_combine;
run;

proc print data=work.np_combine;
	where ParkCode = 'ACAD';
run;

proc contents data=pg2.np_2014;
run; 

proc contents data=work.np_combine; 
run;
*/
