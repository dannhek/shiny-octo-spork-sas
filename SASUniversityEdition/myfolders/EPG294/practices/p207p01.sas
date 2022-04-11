***********************************************************;
*  LESSON 7, PRACTICE 1                                   *;
*  a) Highlight the PROC PRINT step and run the selected  *;
*     code. Note that the Tent, RV, and Backcountry       *;
*     columns contain visitor counts.                     *;
*  b) To convert this wide table to a narrow table, the   *;
*     DATA step must create a new column named CampType   *;
*     with the values Tent, RV, and Backcountry, and      *;
*     another new column named CampCount with the numeric *;
*     counts. The DATA step includes statements to output *;
*     a row for CampType='Tent'. Modify the DATA step to  *;
*     output additional rows for RV and Backcountry.      *;
*  c) Add a LENGTH statement to ensure that the values of *;
*     the CampType column are not truncated.              *;
*  d) Run the DATA step. Confirm that each ParkName value *;
*     has three rows corresponding to the Tent, RV, and   *;
*     Backcountry visitor counts.                         *;
***********************************************************;

proc print data=pg2.np_2017camping;
run;

data work.camping_narrow(drop=Tent RV Backcountry);
	set pg2.np_2017Camping;
	format CampCount comma12.;
	format CampType $char12.;
	CampType='Tent';
	CampCount=Tent;
	output;
	*Add statements to output rows for RV and Backcountry;
	CampType='RV';
	CampCount=RV;
	output;
	CampType='Backcountry';
	CampCount=Backcountry;
	output;
run;



proc print data=pg2.np_2016camping;
run;
/*
data work.camping_wide;
	set pg2.np_2016Camping;
	by ParkName;
	keep ParkName Tent RV Backcountry;
	format CampCount comma12.;
	format CampType $char12.;
	if CampType='Tent' then Tent=CampCount;
	else if CampType='RV' then RV=CampCount;
	else if CampType='Backcountry' then Backcountry=CampCount;
	if last.ParkName;
run;
*/;
data work.camping_wide;
    set pg2.np_2016Camping;
    by ParkName;
    keep ParkName Tent RV Backcountry;
    format Tent RV Backcountry comma12.;
    retain ParkName Tent RV Backcountry;
    if CampType='Tent' then Tent=CampCount;
    else if CampType='RV' then RV=CampCount;
    else if CampType='Backcountry' then Backcountry=CampCount;
    if last.ParkName;
run;
