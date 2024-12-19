// LAS QUERIES DESDE INICO DE CADA HISTÓRICO

    // HISTORICAL VALUE QUERIES 

cot_q_date:{[ETF]
    string each (select date from historical where ticker=ETF)`date
 }
cot_q:{[ETF]
    (select nav_value from historical where ticker=ETF)`nav_value    
 }


    // DAILY SMA QUERIES

sma_q_date:{[ETF]
    string each (select date from historical where ticker=ETF)`date
 }
sma_q:{[ETF]
    (select d200sma from historical where ticker=ETF)`d200sma    
 }


    // MONTHLY SMA QUERIES

msma_q_date:{[ETF]
    string each (select date from historical where ticker=ETF, m200sma<>0n)`date
 }
msma_q:{[ETF]
    (select m200sma from historical where ticker=ETF, m200sma<>0n)`m200sma   
 }


    // INFLOWS - OUTFLOWS % QUERIES

in_out_q_date:{[ETF]
    string each (select date from historical where ticker=ETF, in_out_flow_per<>0n)`date    
 }
in_out_q:{[ETF]
    (select in_out_flow_per from historical where ticker=ETF, in_out_flow_per<>0n)`in_out_flow_per
 }


// RELEVANT MOMENT IN THE SHARE PRICES

// Losses

mom_los_lp_q:{[ETF]
    a: select date, nav_value from historical where ticker=ETF;
    b: select distinct date, nav_value from table_losses where ticker=ETF, elem in (`p5y;`p3y);
    a: update nav_value: 0n from a; 
    a: a lj `date xkey b;
    (select nav_value from a )`nav_value
 }

mom_los_cp_q:{[ETF]
    a: select date, nav_value from historical where ticker=ETF;
    b: select distinct date, nav_value from table_losses where ticker=ETF, elem in (`p1y;`p6m;`p3m);;
    a: update nav_value: 0n from a; 
    a: a lj `date xkey b;
    (select nav_value from a )`nav_value
 }

// Profits

mom_prof_lp_q:{[ETF]
    a: select date, nav_value from historical where ticker=ETF;
    b: select distinct date, nav_value from table_profits where ticker=ETF, elem in (`p5y;`p3y);
    a: update nav_value: 0n from a; 
    a: a lj `date xkey b;
    (select nav_value from a )`nav_value 
 }

mom_prof_cp_q:{[ETF]
    a: select date, nav_value from historical where ticker=ETF;
    b: select distinct date, nav_value from table_profits where ticker=ETF, elem in (`p1y;`p6m;`p3m);
    a: update nav_value: 0n from a; 
    a: a lj `date xkey b;
    (select nav_value from a )`nav_value
 }

//Volatilities Profits

vol_p_5y:{[ETF]
    a: select date, vol5y: daily_5yvol from historical where ticker=ETF;
    b: select distinct date, vol5y from table_profits where ticker=ETF, elem=`p5y;
    a: update vol5y: 0n from a; 
    a: a lj `date xkey b;
    (select vol5y from a )`vol5y
 }
vol_p_3y:{[ETF]
    a: select date, vol3y: daily_3yvol from historical where ticker=ETF;
    b: select distinct date, vol3y from table_profits where ticker=ETF, elem=`p3y;
    a: update vol3y: 0n from a; 
    a: a lj `date xkey b;
    (select vol3y from a )`vol3y
 }
vol_p_1y:{[ETF]
    a: select date, vol1y: daily_1yvol from historical where ticker=ETF;
    b: select distinct date, vol1y from table_profits where ticker=ETF, elem=`p1y;
    a: update vol1y: 0n from a; 
    a: a lj `date xkey b;
    (select vol1y from a )`vol1y
 }
vol_p_3m:{[ETF]
    a: select date, vol3m: daily_3mvol from historical where ticker=ETF;
    b: select distinct date, vol3m from table_profits where ticker=ETF, elem=`p3m;
    a: update vol3m: 0n from a; 
    a: a lj `date xkey b;
    (select vol3m from a )`vol3m
 }
vol_p_6m:{[ETF]
    a: select date, vol6m: daily_6mvol from historical where ticker=ETF;
    b: select distinct date, vol6m from table_profits where ticker=ETF, elem=`p6m;
    a: update vol6m: 0n from a; 
    a: a lj `date xkey b;
    (select vol6m from a )`vol6m
 }

//Volatilities Losses

vol_l_5y:{[ETF]
    a: select date, vol5y: daily_5yvol from historical where ticker=ETF;
    b: select distinct date, vol5y from table_losses where ticker=ETF, elem=`py5;
    a: update vol5y: 0n from a; 
    a: a lj `date xkey b;
    (select vol5y from a )`vol5y
 }
vol_l_3y:{[ETF]
    a: select date, vol3y: daily_3yvol from historical where ticker=ETF;
    b: select distinct date, vol3y from table_losses where ticker=ETF, elem=`p3y;
    a: update vol3y: 0n from a; 
    a: a lj `date xkey b;
    (select vol3y from a )`vol3y
 }
vol_l_1y:{[ETF]
    a: select date, vol1y: daily_1yvol from historical where ticker=ETF;
    b: select distinct date, vol1y from table_losses where ticker=ETF, elem=`p1y;
    a: update vol1y: 0n from a; 
    a: a lj `date xkey b;
    (select vol1y from a )`vol1y
 }
vol_l_3m:{[ETF]
    a: select date, vol3m: daily_3mvol from historical where ticker=ETF;
    b: select distinct date, vol3m from table_losses where ticker=ETF, elem=`p3m;
    a: update vol3m: 0n from a; 
    a: a lj `date xkey b;
    (select vol3m from a )`vol3m
 }
vol_l_6m:{[ETF]
    a: select date, vol6m: daily_6mvol from historical where ticker=ETF;
    b: select distinct date, vol6m from table_losses where ticker=ETF, elem=`p6m;
    a: update vol6m: 0n from a; 
    a: a lj `date xkey b;
    (select vol6m from a )`vol6m
 }

// WHOLE HISTORICAL DAILYS

// Volatilities 

vol_y5y:{[ETF]
    (select daily_5yvol from historical where ticker=ETF)`daily_5yvol
 }

vol_y3y:{[ETF]
    (select daily_3yvol from historical where ticker=ETF)`daily_3yvol
 }

vol_y1y:{[ETF]
    (select daily_1yvol from historical where ticker=ETF)`daily_1yvol
 }

vol_y6m:{[ETF]
    (select daily_6mvol from historical where ticker=ETF)`daily_6mvol
 }

vol_y3m:{[ETF]
    (select daily_3mvol from historical where ticker=ETF)`daily_3mvol
 }

// Daily return y performance

d_ret:{[ETF]
    (select daily_retns from historical where ticker=ETF)`daily_retns
 }

d_perf:{[ETF]
    (select daily_performance from historical where ticker=ETF)`daily_performance
 }

// MOMENTS SELECTION TO REPRESENT

// Long-Term Moments

prof_lp5:{[ETF]
    a: select date, nav_value from historical where ticker=ETF;
    b: select distinct date, nav_value from table_profits where ticker=ETF, elem in (`p5y);
    a: update nav_value: 0n from a; 
    a: a lj `date xkey b;
    (select nav_value from a )`nav_value
 }

prof_lp3:{[ETF]
    a: select date, nav_value from historical where ticker=ETF;
    b: select distinct date, nav_value from table_profits where ticker=ETF, elem in (`p3y);
    a: update nav_value: 0n from a; 
    a: a lj `date xkey b;
    (select nav_value from a )`nav_value
 }

los_lp5:{[ETF]
    a: select date, nav_value from historical where ticker=ETF;
    b: select distinct date, nav_value from table_losses where ticker=ETF, elem in (`p5y);
    a: update nav_value: 0n from a; 
    a: a lj `date xkey b;
    (select nav_value from a )`nav_value
 }

los_lp3:{[ETF]
    a: select date, nav_value from historical where ticker=ETF;
    b: select distinct date, nav_value from table_losses where ticker=ETF, elem in (`p3y);
    a: update nav_value: 0n from a; 
    a: a lj `date xkey b;
    (select nav_value from a )`nav_value
 }


// Short-Term Moments

prof_cp1y:{[ETF]
    a: select date, nav_value from historical where ticker=ETF;
    b: select distinct date, nav_value from table_profits where ticker=ETF, elem in (`p1y);
    a: update nav_value: 0n from a; 
    a: a lj `date xkey b;
    (select nav_value from a )`nav_value
 }
los_cp1y:{[ETF]
    a: select date, nav_value from historical where ticker=ETF;
    b: select distinct date, nav_value from table_losses where ticker=ETF, elem in (`p1y);
    a: update nav_value: 0n from a; 
    a: a lj `date xkey b;
    (select nav_value from a )`nav_value
 }
prof_cp6m:{[ETF]
    a: select date, nav_value from historical where ticker=ETF;
    b: select distinct date, nav_value from table_profits where ticker=ETF, elem in (`p1y);
    a: update nav_value: 0n from a; 
    a: a lj `date xkey b;
    (select nav_value from a )`nav_value
 }
los_cp6m:{[ETF]
    a: select date, nav_value from historical where ticker=ETF;
    b: select distinct date, nav_value from table_losses where ticker=ETF, elem in (`p6m);
    a: update nav_value: 0n from a; 
    a: a lj `date xkey b;
    (select nav_value from a )`nav_value
 }
prof_cp3m:{[ETF]
    a: select date, nav_value from historical where ticker=ETF;
    b: select distinct date, nav_value from table_profits where ticker=ETF, elem in (`p3m);
    a: update nav_value: 0n from a; 
    a: a lj `date xkey b;
    (select nav_value from a )`nav_value
 }
los_cp3m:{[ETF]
    a: select date, nav_value from historical where ticker=ETF;
    b: select distinct date, nav_value from table_losses where ticker=ETF, elem in (`p3m);
    a: update nav_value: 0n from a; 
    a: a lj `date xkey b;
    (select nav_value from a )`nav_value
 }






//----------------------------------------------------------------------------------------------------------

// LAS QUERIES CON FILTRADO POR FECHA DE INICIO

    // HISTORICAL VALUE QUERIES

cot_q_date_F:{[ETF;DATEFILT]
    string each (select date from historical where ticker=ETF, date > DATEFILT)`date
 }
cot_q_F:{[ETF;DATEFILT]
    (select nav_value from historical where ticker=ETF, date > DATEFILT)`nav_value    
 }


    // DAILY SMA QUERIES

sma_q_date_F:{[ETF;DATEFILT]
    string each (select date from historical where ticker=ETF, date > DATEFILT)`date
 }
sma_q_F:{[ETF;DATEFILT]
    (select d200sma from historical where ticker=ETF, date > DATEFILT)`d200sma    
 }


// MONTHLY SMA QUERIES

msma_q_date_F:{[ETF;DATEFILT]
    string each (select date from historical where ticker=ETF, date > DATEFILT, m200sma<>0N)`date
 }
msma_q_F:{[ETF;DATEFILT]
    (select m200sma from historical where ticker=ETF, date > DATEFILT, m200sma<>0N)`m200sma   
 }


// INFLOWS - OUTFLOWS % QUERIES

in_out_q_date_F:{[ETF;DATEFILT]
    string each (select date from historical where ticker=ETF, date > DATEFILT, in_out_flow_per<>0N)`date    
 }

in_out_q_F:{[ETF;DATEFILT]
    (select in_out_flow_per from historical where ticker=ETF, date > DATEFILT, in_out_flow_per<>0N)`in_out_flow_per
 }