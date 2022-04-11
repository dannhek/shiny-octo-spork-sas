**************************************************;
*  Activity 2.05                                 *;
*    Add a subsetting IF statement to output     *;
*    only the final day of each month.           *;
**************************************************;

data houston_monthly;
	set pg2.weather_houston;
	keep Date Month DailyRain MTDRain;
	by Month;
	if first.Month=1 then MTDRain=0;
	MTDRain+DailyRain;
	* if last.month=1;
run;       

