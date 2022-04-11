***********************************************************;
*  Merging Tables                                         *;
***********************************************************;
*  Syntax and Example                                     *;
*                                                         *;
*    PROC SORT DATA=input-table OUT=output-table;         *;
*        BY BY-variable;                                  *;
*    RUN;                                                 *;
*    DATA output-table;                                   *;
*        MERGE input-table1 input-table2 ...;             *;
*        BY BY-variable;                                  *;
*    RUN;                                                 *;
***********************************************************;

/*One to one Merge*/
/*Both tables are already sorted*/
data class2;
   merge sashelp.class pg2.class_teachers;
   by name;
run;

***********************************************************;
*  Demo                                                   *;
*  1) Highlight the two PROC SORT steps and run the       *;
*     selected code. Examine the sorted tables, including *;
*     the number of rows in each. Notice that both tables *;
*     include a column representing basin codes. However, *;
*     the column is named Basin in the STORM_SORT table   *;
*     and BasinCode in the BASINCODES_SORT table.         *;
*  2) To combine the BasinName column with the columns in *;
*     the storm_summary table, the tables need to be      *;
*     merged. Complete the MERGE statement. Use the       *;
*     RENAME= data set option to rename the BasinCode     *;
*     column as Basin in the BASINCODES_SORT table. Add a *;
*     BY statement to combine the sorted tables by Basin. *;
*  3) Run the program and examine the STORM_SUMMARY2      *;
*     table. Notice that the BasinName values have been   *;
*     matched with each of the Basin code values.         *;
*  4) Scroll to the end of the STORM_SUMMARY2 table.      *;
*     Notice that when the value of Basin is lowercase    *;
*     na, the values for BasinName are missing. This is   *;
*     because lowercase na occurs only in the STORM_SORT  *;
*     table and not in BASINCODES_SORT.                   *;
***********************************************************;

proc sort data=pg2.storm_summary out=storm_sort;
	by Basin;
run;

proc sort data=pg2.storm_basincodes out=basincodes_sort;
	by BasinCode;
run;

data storm_summary2;
	merge ;
run;
