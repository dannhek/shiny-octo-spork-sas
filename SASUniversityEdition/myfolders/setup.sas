/***********************************************/
/* In the line of code below, replace FILEPATH */
/* with the path to your EPG194/data folder    */
/***********************************************/

%let path1=/folders/myfolders/EPG194/data;
%let path2=/folders/myfolders/EPG294/data;
%let stat1=/folders/myfolders/STAT/data;
%let outpath=/folders/myfolders/exports;

/**********************************************/
/* DO NOT EDIT THE CODE BELOW                 */
/**********************************************/

libname PG1 "&path1";
libname PG2 "&path2";
libname STAT1 "&stat1";

options fmtsearch=(stat1.myfmts);

proc format library=stat1.myfmts;
run;

/* create macro variables to hold the names of the interval and */
/* categorical variables used in the demo and practice programs */

%let interval=Gr_Liv_Area Basement_Area Garage_Area Deck_Porch_Area 
         Lot_Area Age_Sold Bedroom_AbvGr Total_Bathroom;

%let categorical=House_Style2 Overall_Qual2 Overall_Cond2 Fireplaces 
         Season_Sold Garage_Type_2 Foundation_2 Heating_QC 
         Masonry_Veneer Lot_Shape_2 Central_Air;

