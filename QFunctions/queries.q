// LAS QUERIES DESDE INICO DE CADA HISTÓRICO

    // HISTORICAL VALUE QUERIES 

cot_q_date:{[ETF]
    string each exec date from historical where ticker=ETF
 }
cot_q:{[ETF]
    exec nav_value from historical where ticker=ETF    
 }


// DAILY SMA QUERIES

sma_q_date:{[ETF]
    string each exec date from historical where ticker=ETF
 }
sma_q:{[ETF]
    exec d200sma from historical where ticker=ETF
 }


    // MONTHLY SMA QUERIES

msma_q_date:{[ETF]
    string each exec date from historical where ticker=ETF, m200sma<>0N
 }
msma_q:{[ETF]
    exec m200sma from historical where ticker=ETF, m200sma<>0N   
 }


    // INFLOWS - OUTFLOWS % QUERIES

in_out_q_date:{[ETF]
    string each exec date from historical where ticker=ETF, in_out_flow_per<>0N   
 }
in_out_q:{[ETF]
    exec in_out_flow_per from historical where ticker=ETF, in_out_flow_per<>0N
 }


// RELEVANT MOMENT IN THE SHARE PRICES

// Losses

mom_los_lp_q:{[ETF]
    a: select date, nav_value from historical where ticker=ETF;
    b: select distinct date, nav_value from table_losses where ticker=ETF, elem in (`p5y;`p3y);
    a: update nav_value: 0n from a; 
    a: a lj `date xkey b;
    exec nav_value from a
 }

mom_los_cp_q:{[ETF]
    a: select date, nav_value from historical where ticker=ETF;
    b: select distinct date, nav_value from table_losses where ticker=ETF, elem in (`p1y;`p6m;`p3m);;
    a: update nav_value: 0n from a; 
    a: a lj `date xkey b;
    exec nav_value from a
 }

// Profits

mom_prof_lp_q:{[ETF]
    a: select date, nav_value from historical where ticker=ETF;
    b: select distinct date, nav_value from table_profits where ticker=ETF, elem in (`p5y;`p3y);
    a: update nav_value: 0n from a; 
    a: a lj `date xkey b;
    exec nav_value from a
 }

mom_prof_cp_q:{[ETF]
    a: select date, nav_value from historical where ticker=ETF;
    b: select distinct date, nav_value from table_profits where ticker=ETF, elem in (`p1y;`p6m;`p3m);
    a: update nav_value: 0n from a; 
    a: a lj `date xkey b;
    exec nav_value from a
 }

// MOMENTS SELECTION TO REPRESENT

// Long-Term Moments

prof_lp5:{[ETF]
    a: select date, nav_value from historical where ticker=ETF;
    b: select distinct date, nav_value from table_profits where ticker=ETF, elem in (`p5y);
    a: update nav_value: 0n from a; 
    a: a lj `date xkey b;
    exec nav_value from a
 }

prof_lp3:{[ETF]
    a: select date, nav_value from historical where ticker=ETF;
    b: select distinct date, nav_value from table_profits where ticker=ETF, elem in (`p3y);
    a: update nav_value: 0n from a; 
    a: a lj `date xkey b;
    exec nav_value from a
 }

los_lp5:{[ETF]
    a: select date, nav_value from historical where ticker=ETF;
    b: select distinct date, nav_value from table_losses where ticker=ETF, elem in (`p5y);
    a: update nav_value: 0n from a; 
    a: a lj `date xkey b;
    exec nav_value from a
 }

los_lp3:{[ETF]
    a: select date, nav_value from historical where ticker=ETF;
    b: select distinct date, nav_value from table_losses where ticker=ETF, elem in (`p3y);
    a: update nav_value: 0n from a; 
    a: a lj `date xkey b;
    exec nav_value from a
 }


// Short-Term Moments

prof_cp1y:{[ETF]
    a: select date, nav_value from historical where ticker=ETF;
    b: select distinct date, nav_value from table_profits where ticker=ETF, elem in (`p1y);
    a: update nav_value: 0n from a; 
    a: a lj `date xkey b;
    exec nav_value from a
 }
los_cp1y:{[ETF]
    a: select date, nav_value from historical where ticker=ETF;
    b: select distinct date, nav_value from table_losses where ticker=ETF, elem in (`p1y);
    a: update nav_value: 0n from a; 
    a: a lj `date xkey b;
    exec nav_value from a
 }
prof_cp6m:{[ETF]
    a: select date, nav_value from historical where ticker=ETF;
    b: select distinct date, nav_value from table_profits where ticker=ETF, elem in (`p1y);
    a: update nav_value: 0n from a; 
    a: a lj `date xkey b;
    exec nav_value from a
 }
los_cp6m:{[ETF]
    a: select date, nav_value from historical where ticker=ETF;
    b: select distinct date, nav_value from table_losses where ticker=ETF, elem in (`p6m);
    a: update nav_value: 0n from a; 
    a: a lj `date xkey b;
    exec nav_value from a
 }
prof_cp3m:{[ETF]
    a: select date, nav_value from historical where ticker=ETF;
    b: select distinct date, nav_value from table_profits where ticker=ETF, elem in (`p3m);
    a: update nav_value: 0n from a; 
    a: a lj `date xkey b;
    exec nav_value from a
 }
los_cp3m:{[ETF]
    a: select date, nav_value from historical where ticker=ETF;
    b: select distinct date, nav_value from table_losses where ticker=ETF, elem in (`p3m);
    a: update nav_value: 0n from a; 
    a: a lj `date xkey b;
    exec nav_value from a
 }




//Volatilities Profits

vol_p_5y:{[ETF]
    a: select date, vol5y: daily_5yvol from historical where ticker=ETF;
    b: select distinct date, vol5y from table_profits where ticker=ETF, elem=`p5y;
    a: update vol5y: 0n from a; 
    a: a lj `date xkey b;
    exec vol5y from a
 }
vol_p_3y:{[ETF]
    a: select date, vol3y: daily_3yvol from historical where ticker=ETF;
    b: select distinct date, vol3y from table_profits where ticker=ETF, elem=`p3y;
    a: update vol3y: 0n from a; 
    a: a lj `date xkey b;
    exec vol3y from a
 }
vol_p_1y:{[ETF]
    a: select date, vol1y: daily_1yvol from historical where ticker=ETF;
    b: select distinct date, vol1y from table_profits where ticker=ETF, elem=`p1y;
    a: update vol1y: 0n from a; 
    a: a lj `date xkey b;
    exec vol1y from a
 }
vol_p_6m:{[ETF]
    a: select date, vol6m: daily_6mvol from historical where ticker=ETF;
    b: select distinct date, vol6m from table_profits where ticker=ETF, elem=`p6m;
    a: update vol6m: 0n from a; 
    a: a lj `date xkey b;
    exec vol6m from a
 }
vol_p_3m:{[ETF]
    a: select date, vol3m: daily_3mvol from historical where ticker=ETF;
    b: select distinct date, vol3m from table_profits where ticker=ETF, elem=`p3m;
    a: update vol3m: 0n from a; 
    a: a lj `date xkey b;
    exec vol3m from a
 }


//Volatilities Losses

vol_l_5y:{[ETF]
    a: select date, vol5y: daily_5yvol from historical where ticker=ETF;
    b: select distinct date, vol5y from table_losses where ticker=ETF, elem=`py5;
    a: update vol5y: 0n from a; 
    a: a lj `date xkey b;
    exec vol5y from a
 }
vol_l_3y:{[ETF]
    a: select date, vol3y: daily_3yvol from historical where ticker=ETF;
    b: select distinct date, vol3y from table_losses where ticker=ETF, elem=`p3y;
    a: update vol3y: 0n from a; 
    a: a lj `date xkey b;
    exec vol3y from a
 }
vol_l_1y:{[ETF]
    a: select date, vol1y: daily_1yvol from historical where ticker=ETF;
    b: select distinct date, vol1y from table_losses where ticker=ETF, elem=`p1y;
    a: update vol1y: 0n from a; 
    a: a lj `date xkey b;
    exec vol1y from a
 }
vol_l_6m:{[ETF]
    a: select date, vol6m: daily_6mvol from historical where ticker=ETF;
    b: select distinct date, vol6m from table_losses where ticker=ETF, elem=`p6m;
    a: update vol6m: 0n from a; 
    a: a lj `date xkey b;
    exec vol6m from a
 }
vol_l_3m:{[ETF]
    a: select date, vol3m: daily_3mvol from historical where ticker=ETF;
    b: select distinct date, vol3m from table_losses where ticker=ETF, elem=`p3m;
    a: update vol3m: 0n from a; 
    a: a lj `date xkey b;
    exec vol3m from a
 }


// WHOLE HISTORICAL DAILYS

// Volatilities 

vol_y5y:{[ETF]
    exec daily_5yvol from historical where ticker=ETF
 }

vol_y3y:{[ETF]
    exec daily_3yvol from historical where ticker=ETF
 }

vol_y1y:{[ETF]
    exec daily_1yvol from historical where ticker=ETF
 }

vol_y6m:{[ETF]
    exec daily_6mvol from historical where ticker=ETF
 }

vol_y3m:{[ETF]
    exec daily_3mvol from historical where ticker=ETF
 }

// Daily return y performance

d_ret:{[ETF]
    exec daily_retns from historical where ticker=ETF
 }

d_perf:{[ETF]
    exec daily_performance from historical where ticker=ETF
 }








//----------------------------------------------------------------------------------------------------------

// LAS QUERIES CON FILTRADO POR FECHA DE INICIO

    // HISTORICAL VALUE QUERIES

cot_q_date_F:{[ETF;DATEFILT]
    string each exec date from historical where ticker=ETF, date > DATEFILT
 }
cot_q_F:{[ETF;DATEFILT]
    exec nav_value from historical where ticker=ETF, date > DATEFILT    
 }


    // DAILY SMA QUERIES

sma_q_date_F:{[ETF;DATEFILT]
    string each exec date from historical where ticker=ETF, date > DATEFILT
 }
sma_q_F:{[ETF;DATEFILT]
    exec d200sma from historical where ticker=ETF, date > DATEFILT    
 }


// MONTHLY SMA QUERIES

msma_q_date_F:{[ETF;DATEFILT]
    string each exec date from historical where ticker=ETF, date > DATEFILT, m200sma<>0N
 }
msma_q_F:{[ETF;DATEFILT]
    exec m200sma from historical where ticker=ETF, date > DATEFILT, m200sma<>0N   
 }


// INFLOWS - OUTFLOWS % QUERIES

in_out_q_date_F:{[ETF;DATEFILT]
    string each exec date from historical where ticker=ETF, date > DATEFILT, in_out_flow_per<>0N    
 }

in_out_q_F:{[ETF;DATEFILT]
    exec in_out_flow_per from historical where ticker=ETF, date > DATEFILT, in_out_flow_per<>0N
 }