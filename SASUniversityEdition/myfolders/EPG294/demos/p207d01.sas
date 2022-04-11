***************************************************************;
*  Creating a Stacked Table with the DATA Step               *;
***************************************************************;

***************************************************************;
*  Demo                                                       *;
*      View steps in the course notes to use the DATA step    *;
*      debugger.                                              *;
***************************************************************;

data class_test_narrow;
	set pg2.class_test_wide;
	keep Name Subject Score;
	length Subject $ 7;
	Subject="Math";
	Score=Math;
	output;
	Subject="Reading";
	Score=Reading;
	output;
run;
