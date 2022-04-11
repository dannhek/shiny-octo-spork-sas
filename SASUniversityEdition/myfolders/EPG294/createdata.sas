
/**********************************************/
/* You must run LIBNAME.SAS before you run    */
/* this code to create your data for EPG294   */
/*                                            */
/* DO NOT EDIT THE CODE BELOW                 */
/**********************************************/

%include "&path2/_1createdata_pg2.sas";
%include "&path2/_2createdata_pg2.sas";
%include "&path2/_3createdata_pg2.sas";

proc contents data=pg2._all_ nods;
run;
