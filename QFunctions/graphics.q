// EN PRIMER LUGAR LAS FUNCIONES COMUNES A ESTAS FUNCIONES
hist_legend:{[NAME;DATE]
    title: $[DATE=-1; "HISTORICAL - ",NAME; "HISTORICAL - ",NAME," FROM ",(string DATE)];
    plt[`:title][title];
    plt[`:xlabel]["DATE"];
    plt[`:ylabel]["NAV VALUE"];
    plt[`:legend][("NAV VALUE";"Daily SMA 200";"Monthly SMA 200")];
 };
in_out_legend:{[NAME;DATE]
    title: $[DATE=-1;"% INFLOWS-OUTFLOWS - ",NAME; "% INFLOWS-OUTFLOWS - ",NAME," FROM ",(string DATE)];
    plt[`:title][title];
    plt[`:xlabel]["DATE"];
    plt[`:ylabel]["VALUE UP/DOWN"];
    plt[`:legend][("Inflows";"0")];
 };

format:{
    ax: plt[`:gca][];
    ax[`:set_facecolor]["#FFFCF5"];
    ax[`:xaxis][`:set_major_locator][mdates[`:AutoDateLocator][]];
    plt[`:xticks][;][;][(`rotation;45)];
    plt[`:gcf][][`:autofmt_xdate][];
    plt[`:gcf][][`:patch][`:set_facecolor]["w"]; 
    plt[`:grid][];
 };



// LAS FUNCIONES PARA REPRESENTAR LAS GRÁFICAS

historical_g:{[ETF]
    plt[`:clf][];
    plt[`:figure][(`figsize);(12;8)]; 
    plt[`:plot][cot_q_date[ETF];cot_q[ETF];"y-"];
    plt[`:plot][sma_q_date[ETF];sma_q[ETF];"r-"];
    plt[`:plot][msma_q_date[ETF];msma_q[ETF];"g-"];
    format[];
    name: string ETF;
    hist_legend[name;-1];
    plt[`:tight_layout][];
    plt[`:savefig]["Data/DataWarehouse/Images/Hist/",name,".png"];
 };


historical_g_F:{[ETF;DATE]
    plt[`:clf][];
    plt[`:figure][(`figsize);(12;8)]; 
    plt[`:plot][cot_q_date_F[ETF;DATE];cot_q_F[ETF;DATE];"y-"];
    plt[`:plot][sma_q_date_F[ETF;DATE];sma_q_F[ETF;DATE];"r-"];
    plt[`:plot][msma_q_date_F[ETF;DATE];msma_q_F[ETF;DATE];"g-"];
    format[];
    name: string ETF;
    hist_legend[name;DATE];
    plt[`:tight_layout][];
    plt[`:savefig]["Data/DataWarehouse/Images/Hist/",name,"-",(string DATE),".png"];
 };

in_outflow_g:{[ETF]
    plt[`:clf][];
    plt[`:figure][(`figsize);(12;8)];
    plt[`:plot][in_out_q_date[ETF];in_out_q[ETF]; "b-o"];
    plt[`:axhline][(0)]; 
    format[];
    name: string ETF;
    in_out_legend[name;-1];
    plt[`:tight_layout][];
    plt[`:savefig]["Data/DataWarehouse/Images/Inflow-Outflow/",name,".png"];
 };

in_outflow_g_F:{[ETF;DATE]
    plt[`:clf][];
    plt[`:figure][(`figsize);(12;8)];
    plt[`:plot][in_out_q_date_F[ETF;DATE];in_out_q_F[ETF;DATE]; "b-o"];
    plt[`:axhline][(0)];
    format[];
    name: string ETF;
    in_out_legend[name;DATE];
    plt[`:tight_layout][];
    plt[`:savefig]["Data/DataWarehouse/Images/Inflow-Outflow/",name,"-",(string DATE),".png"];
 };

hist_lp_relev:{[ETF]
    plt[`:clf][];
    plt[`:figure][(`figsize);(12;8)];
    plt[`:plot][cot_q_date[ETF];cot_q[ETF];"y-"];
    plt[`:plot][cot_q_date[ETF];mom_prof_lp_q[ETF];"g+"];
    plt[`:plot][cot_q_date[ETF];mom_los_lp_q[ETF];"r+"];
    plt[`:plot][sma_q_date[ETF];sma_q[ETF];"b-"];
    plt[`:plot][msma_q_date[ETF];msma_q[ETF];"c-"];
    format[];
    plt[`:title]["HISTORICAL *",(string ETF),"* - RELEVANT MOMENTS OF 25%"];
    plt[`:xlabel]["DATE"];
    plt[`:ylabel]["NAV VALUE"];
    plt[`:legend][("NAV VALUE";"Profits Long Term Moments";"Losses Long Term Moments")];
    plt[`:tight_layout][];
    plt[`:savefig]["Data/DataWarehouse/Images/Hist/",(string ETF),"-LT.png"];
 };

hist_cp_relev:{[ETF]
    plt[`:clf][];
    plt[`:figure][(`figsize);(12;8)]; 
    plt[`:plot][cot_q_date[ETF];cot_q[ETF];"y-"];
    plt[`:plot][cot_q_date[ETF];mom_prof_cp_q[ETF];"g."];
    plt[`:plot][cot_q_date[ETF];mom_los_cp_q[ETF];"r."];
    plt[`:plot][sma_q_date[ETF];sma_q[ETF];"b-"];
    plt[`:plot][msma_q_date[ETF];msma_q[ETF];"c-"];
    format[];
    plt[`:title]["HISTORICAL *",(string ETF),"* - RELEVANT MOMENTS OF 25%"];
    plt[`:xlabel]["DATE"];
    plt[`:ylabel]["NAV VALUE"];
    plt[`:legend][("NAV VALUE";"Profits Short Term Moments";"Losses Short Term Moments")];
    plt[`:tight_layout][];
    plt[`:savefig]["Data/DataWarehouse/Images/Hist/",(string ETF),"-ST.png"];
 };

daily_vol:{ [ETF]
    plt[`:clf][];
    plt[`:figure][(`figsize);(12;8)];
    plt[`:plot][cot_q_date[ETF];vol_y5y[ETF];"b-"];
    plt[`:plot][cot_q_date[ETF];vol_y3y[ETF];"y-"];
    plt[`:plot][cot_q_date[ETF];vol_y1y[ETF];"r-"];
    plt[`:plot][cot_q_date[ETF];vol_y6m[ETF];"m-"];
    plt[`:plot][cot_q_date[ETF];vol_y3m[ETF];"c-"];
    format[];
    title: "DAILY VOLATILITIES - ",(string ETF);
    plt[`:title][title];
    plt[`:xlabel]["DATE"];
    plt[`:ylabel]["VALUE UP/DOWN"];
    plt[`:legend][("Vol from 5 years";"Vol from 3 years";"Vol from 1 year";"Vol from 6 months";"Vol from 3 months")];
    plt[`:tight_layout][];
    plt[`:savefig]["Data/DataWarehouse/Images/Analytics/DailyVolatilities/",(string ETF),"-dailyvolatilities.png"];
 };

daily_vol_mom:{ [ETF]
    plt[`:clf][];
    plt[`:figure][(`figsize);(12;8)];
    plt[`:plot][cot_q_date[ETF];vol_y5y[ETF];"b-"];
    plt[`:plot][cot_q_date[ETF];vol_y3y[ETF];"y-"];
    plt[`:plot][cot_q_date[ETF];vol_y1y[ETF];"r-"];
    plt[`:plot][cot_q_date[ETF];vol_y6m[ETF];"m-"];
    plt[`:plot][cot_q_date[ETF];vol_y3m[ETF];"c-"];
    plt[`:plot][cot_q_date[ETF];vol_p_5y[ETF];"k+"];
    plt[`:plot][cot_q_date[ETF];vol_p_3y[ETF];"k+"];
    plt[`:plot][cot_q_date[ETF];vol_p_1y[ETF];"k+"];
    plt[`:plot][cot_q_date[ETF];vol_p_6m[ETF];"k+"];
    plt[`:plot][cot_q_date[ETF];vol_p_3m[ETF];"k+"];
    format[];
    title: "DAILY VOLATILITIES - ",(string ETF);
    plt[`:title][title];
    plt[`:xlabel]["DATE"];
    plt[`:ylabel]["VALUE UP/DOWN"];
    plt[`:legend][("Vol from 5 years";"Vol from 3 years";"Vol from 1 year";"Vol from 6 months";"Vol from 3 months")];
    plt[`:tight_layout][];
    plt[`:savefig]["Data/DataWarehouse/Images/Analytics/DailyVolatilities/",(string ETF),"-dailyvolatilitiesMoments.png"];
 };

daily_ret:{ [ETF]
    plt[`:clf][];
    plt[`:figure][(`figsize);(12;8)];
    plt[`:plot][cot_q_date[ETF];d_ret[ETF];"cd"];
    plt[`:axhline][0];
    format[];
    title: "DAILY RETURN - ",(string ETF);
    plt[`:title][title];
    plt[`:xlabel]["DATE"];
    plt[`:ylabel]["VALUE UP/DOWN"];
    plt[`:legend][("DAILY RETURN";"EJE X-0")];
    plt[`:tight_layout][];
    plt[`:savefig]["Data/DataWarehouse/Images/Analytics/DailyReturns/",(string ETF),"-dailyreturns.png"];
 };

hist_filter_msma_5y:{[ETF;EQUITY]
    plt[`:clf][];
    plt[`:figure][(`figsize);(12;8)];
    //fig.patch.set_facecolor('lightblue');
    plt[`:plot][cot_q_date[ETF];cot_q[ETF];"y-"];
    plt[`:plot][cot_q_date[ETF];prof_lp5[ETF];"g+"];
    plt[`:plot][cot_q_date[ETF];los_lp5[ETF];"r+"];
    plt[`:plot][sma_q_date[ETF];sma_q[ETF];"b-"];
    plt[`:plot][msma_q_date[ETF];msma_q[ETF];"c-"];
    format[];
    plt[`:title][(string ETF)," - 5 YEARS RELEVANT MOMENTS OF 25%"];
    plt[`:xlabel]["DATE"];
    plt[`:ylabel]["NAV VALUE"];
    plt[`:legend][("NAV VALUE";"5-year Profits Moments";
                   "5-year Losses Moments";
                   "Daily 200 SMA"; "Monthly 200 SMA"
                  )];
    plt[`:tight_layout][];
    plt[`:savefig]["Data/DataWarehouse/Images/Analytics/",EQUITY,"/",(string ETF)," - moments 5 years.png"];
 };

hist_filter_msma_3y:{[ETF;EQUITY]
    plt[`:clf][];
    plt[`:figure][(`figsize);(12;8)];
    plt[`:plot][cot_q_date[ETF];cot_q[ETF];"y-"];
    plt[`:plot][cot_q_date[ETF];prof_lp3[ETF];"g+"];
    plt[`:plot][cot_q_date[ETF];los_lp3[ETF];"r+"];
    plt[`:plot][sma_q_date[ETF];sma_q[ETF];"b-"];
    plt[`:plot][msma_q_date[ETF];msma_q[ETF];"c-"];
    format[];
    plt[`:title][(string ETF)," - 3 YEARS RELEVANT MOMENTS OF 25%"];
    plt[`:xlabel]["DATE"];
    plt[`:ylabel]["NAV VALUE"];
    plt[`:legend][("NAV VALUE";"3-year Profits Moments";
                   "3-year Losses Moments";
                   "Daily 200 SMA"; "Monthly 200 SMA"
                  )];
    plt[`:tight_layout][];
    plt[`:savefig]["Data/DataWarehouse/Images/Analytics/",EQUITY,"/",(string ETF)," - moments 3 years.png"];
 };

hist_filter_msma_1y:{[ETF;EQUITY]
    plt[`:clf][];
    plt[`:figure][(`figsize);(12;8)];
    plt[`:plot][cot_q_date[ETF];cot_q[ETF];"y-"];
    plt[`:plot][cot_q_date[ETF];prof_cp1y[ETF];"g+"];
    plt[`:plot][cot_q_date[ETF];los_cp1y[ETF];"r+"];
    plt[`:plot][sma_q_date[ETF];sma_q[ETF];"b-"];
    plt[`:plot][msma_q_date[ETF];msma_q[ETF];"c-"];
    format[];
    plt[`:title][(string ETF)," - 1 YEARS RELEVANT MOMENTS OF 25%"];
    plt[`:xlabel]["DATE"];
    plt[`:ylabel]["NAV VALUE"];
    plt[`:legend][("NAV VALUE";"1-year Profits Moments";
                   "1-year Losses Moments";
                   "Daily 200 SMA"; "Monthly 200 SMA"
                  )];
    plt[`:tight_layout][];
    plt[`:savefig]["Data/DataWarehouse/Images/Analytics/",EQUITY,"/",(string ETF)," - moments 1 years.png"];
 };

hist_filter_msma_6m:{[ETF;EQUITY]
    plt[`:clf][];
    plt[`:figure][(`figsize);(12;8)];
    plt[`:plot][cot_q_date[ETF];cot_q[ETF];"y-"];
    plt[`:plot][cot_q_date[ETF];prof_cp6m[ETF];"g+"];
    plt[`:plot][cot_q_date[ETF];los_cp6m[ETF];"r+"];
    plt[`:plot][sma_q_date[ETF];sma_q[ETF];"b-"];
    plt[`:plot][msma_q_date[ETF];msma_q[ETF];"c-"];
    format[];
    plt[`:title][(string ETF)," - 6 MONTHS RELEVANT MOMENTS OF 25%"];
    plt[`:xlabel]["DATE"];
    plt[`:ylabel]["NAV VALUE"];
    plt[`:legend][("NAV VALUE";"6-months Profits Moments";
                   "6-months Losses Moments";
                   "Daily 200 SMA"; "Monthly 200 SMA"
                  )];
    plt[`:tight_layout][];
    plt[`:savefig]["Data/DataWarehouse/Images/Analytics/",EQUITY,"/",(string ETF)," - moments 6 months.png"];
 };

hist_filter_msma_3m:{[ETF;EQUITY]
    plt[`:clf][];
    plt[`:figure][(`figsize);(12;8)];
    plt[`:plot][cot_q_date[ETF];cot_q[ETF];"y-"];
    plt[`:plot][cot_q_date[ETF];prof_cp3m[ETF];"g+"];
    plt[`:plot][cot_q_date[ETF];los_cp3m[ETF];"r+"];
    plt[`:plot][sma_q_date[ETF];sma_q[ETF];"b-"];
    plt[`:plot][msma_q_date[ETF];msma_q[ETF];"c-"];
    format[];
    plt[`:title][(string ETF)," - 3 MONTHS RELEVANT MOMENTS OF 25%"];
    plt[`:xlabel]["DATE"];
    plt[`:ylabel]["NAV VALUE"];
    plt[`:legend][("NAV VALUE";"3-months Profits Moments";
                   "3-months Losses Moments";
                   "Daily 200 SMA"; "Monthly 200 SMA"
                  )];
    plt[`:tight_layout][];
    plt[`:savefig]["Data/DataWarehouse/Images/Analytics/",EQUITY,"/",(string ETF)," - moments 3 months.png"];
 };
