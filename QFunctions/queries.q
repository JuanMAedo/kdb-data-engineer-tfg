// LAS QUERIES DESDE INICO DE CADA HISTÓRICO

    // HISTORICAL VALUE QUERIES 

ax_x:{[ETF]
    string each (select date from historical where ticker=ETF)`date
 }
ax_y:{[ETF]
    (select nav_value from historical where ticker=ETF)`nav_value    
 }


    // DAILY SMA QUERIES

aSMA_x:{[ETF]
    string each (select date from historical where ticker=ETF)`date
 }
aSMA_y:{[ETF]
    (select d200sma from historical where ticker=ETF)`d200sma    
 }


    // MONTHLY SMA QUERIES

aMSMA_x:{[ETF]
    string each (select date from historical where ticker=ETF, m200sma<>0N)`date
 }
aMSMA_y:{[ETF]
    (select m200sma from historical where ticker=ETF, m200sma<>0N)`m200sma   
 }


    // INFLOWS - OUTFLOWS % QUERIES

in_out_x:{[ETF]
    string each (select date from historical where ticker=ETF, in_out_flow_per<>0N)`date    
 }
in_out_y:{[ETF]
    (select in_out_flow_per from historical where ticker=ETF, in_out_flow_per<>0N)`in_out_flow_per
 }


//----------------------------------------------------------------------------------------------------------

// LAS QUERIES CON FILTRADO POR FECHA DE INICIO

    // HISTORICAL VALUE QUERIES

ax_x_F:{[ETF;DATEFILT]
    string each (select date from historical where ticker=ETF, date > DATEFILT)`date
 }
ax_y_F:{[ETF;DATEFILT]
    (select nav_value from historical where ticker=ETF, date > DATEFILT)`nav_value    
 }


    // DAILY SMA QUERIES

aSMA_x_F:{[ETF;DATEFILT]
    string each (select date from historical where ticker=ETF, date > DATEFILT)`date
 }
aSMA_y_F:{[ETF;DATEFILT]
    (select d200sma from historical where ticker=ETF, date > DATEFILT)`d200sma    
 }


// MONTHLY SMA QUERIES

aMSMA_x_F:{[ETF;DATEFILT]
    string each (select date from historical where ticker=ETF, date > DATEFILT, m200sma<>0N)`date
 }
aMSMA_y_F:{[ETF;DATEFILT]
    (select m200sma from historical where ticker=ETF, date > DATEFILT, m200sma<>0N)`m200sma   
 }


// INFLOWS - OUTFLOWS % QUERIES

in_out_x_F:{[ETF;DATEFILT]
    string each (select date from historical where ticker=ETF, date > DATEFILT, in_out_flow_per<>0N)`date    
 }

in_out_y_F:{[ETF;DATEFILT]
    (select in_out_flow_per from historical where ticker=ETF, date > DATEFILT, in_out_flow_per<>0N)`in_out_flow_per
 }