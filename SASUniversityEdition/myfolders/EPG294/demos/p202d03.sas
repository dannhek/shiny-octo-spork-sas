***********************************************************;
*  Creating an Accumulating Column within Groups          *;
***********************************************************;
*  Syntax and Example                                     *;
*                                                         *;
*    Subsetting IF statement:                             *;
*        IF expression;                                   *;
*    FIRST.bycol                                          *;
*    LAST.bycol                                           *;
***********************************************************;

proc sort data=pg2.storm_2017 out=storm2017_sort;
	by Basin;
run;

data storm2017_max;
    set storm2017_sort;
    by Basin;
    if last.Basin=1;
    StormLength=EndDate-StartDate;
    MaxWindKM=MaxWindMPH*1.60934;
run;

***********************************************************;
*  Demo                                                   *;
*  1) Highlight the DATA step and run the selected code.  *;
*     Notice that YTDRain is an accumulating column that  *;
*     creates a running total of DailyRain. Also notice   *;
*     that the data is sorted by Month and Date.          *;
*  2) Add a BY statement to process the rows by groups    *;
*     based on the values of Month.                       *;
*  3) Change the new accumulating column to MTDRain in    *;
*     the KEEP and sum statements.                        *;
*  4) Reset MTDRain to 0 each time that SAS reaches the   *;
*     first row within a new Month group. Highlight the   *;
*     DATA step and run the selected code.                *;
***********************************************************;

data houston_monthly;
	set pg2.weather_houston;
	keep Date Month DailyRain YTDRain;
	YTDRain+DailyRain;
run;       

