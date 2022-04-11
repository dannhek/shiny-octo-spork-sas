data work.testdata;
	input var$;
	datalines;
	a
	b
	FOO
	
	BAR
	;
run;

data work.testdata2;
	set work.testdata;
	if var = "" then is_blank = 1;
	else is_blank = 0;
	if length(var) = 0 then is_length_0 = 1;
	else is_length_0 = 0;
	len = length(VAR);
	dat = mdy(1,1,1950);

run;