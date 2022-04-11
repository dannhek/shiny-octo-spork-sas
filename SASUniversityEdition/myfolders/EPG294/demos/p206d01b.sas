***********************************************************;
*  Executing an Iterative DO Loop                         *;
***********************************************************;
*  Syntax                                                 *;
*                                                         *;
*    DATA output-table;                                   *;
*        . . .                                            *;
*        DO index-column = start TO stop <BY increment>;  *;
*           . . . repetitive code . . .                   *;
*        END;                                             *;
*        . . .                                            *;
*    RUN;                                                 *;
***********************************************************;

***********************************************************;
*  Demo                                                   *;
*  1) Notice the three PUTLOG statements in the DATA step.*;
*  2) Run the program and view the Forecast output table. *;
*     Notice that there are three rows (Year 1, 2, and 3) *;
*     for the first two input rows.                       *;
*  3) View the PUTLOG text in the SAS log.                *;
***********************************************************;

data forecast;
    putlog 'Top of DATA Step ' Year= _N_=;
    set sashelp.shoes(obs=2 rename=(Sales=ProjectedSales));
    do Year = 1 to 3;
        ProjectedSales=ProjectedSales*1.05;
        output;
        putlog 'Value of Year written to table: ' Year=;
    end;
    putlog 'Outside of DO Loop: ' Year=;
    keep Region Product Subsidiary Year ProjectedSales;
    format ProjectedSales dollar10.;
run;

