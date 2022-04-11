**************************************************;
*  Creating an Accumulating Column               *;
**************************************************;
*  Demo                                          *;
*  Refer to the course notes for detailed steps. *;
**************************************************;

data houston_rain;
	set pg2.weather_houston;
	keep Date DailyRain YTDRain;
	YTDRain=YTDRain+DailyRain;
run;
