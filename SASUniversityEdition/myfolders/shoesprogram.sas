data work.shoes;
 set sashelp.shoes;
 NetSales=Sales-Returns;
run;

proc means data=work.shoes mean sum maxdec=2;
	var netsales;
	class region;
run;


proc print data = sashelp.shoes;
run;