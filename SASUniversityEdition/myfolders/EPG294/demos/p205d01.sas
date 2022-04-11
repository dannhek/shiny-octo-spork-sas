****************************************************************;
*  Concatenating Tables                                        *;
****************************************************************;
*  Syntax and Example                                          *;
*                                                              *;
*    DATA output-table;                          	           *;
*        SET input-table1(rename=(current-colname=new-colname))*;
*            input-table2 ...;                                 *;
*    RUN;                                                      *;
****************************************************************;

*Example with all matching columns;
data class_current;
	set sashelp.class pg2.class_new;
run;

*Example with columns having different names;
data class_current;
	set sashelp.class pg2.class_new2(rename=(Student=Name));
run;

***********************************************************;
*  Demo                                                   *;
*  1) Modify the SET statement to concatenate             *;
*     PG2.STORM_SUMMARY and PG2.STORM_2017. Highlight the *;
*     DATA and PROC SORT steps and run the selected code. *;
*  2) Notice that for the 2017 storms Year is populated   *;
*     with 2017, Location has values, and Season is       *;
*     missing. Rows from the storm_summary table          *;
*     (starting with row 55) have Season populated and    *;
*     Year and Location are missing.                      *;
*  3) After PG2.STORM_2017, use the RENAME= data set      *;
*     option to rename Year as Season. Use the DROP= data *;
*     set option to drop Location. Highlight the demo     *;
*     program and run the selected code.                  *;
***********************************************************;

data storm_complete;
	*Complete the SET statement;
	set   ; 
	Basin=upcase(Basin);
run;

proc sort data=storm_complete;
	by descending StartDate;
run;
