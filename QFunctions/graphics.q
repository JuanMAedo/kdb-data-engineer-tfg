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
    //ax[`:set_facecolor]["#f0f0f0"]; 
    ax[`:xaxis][`:set_major_locator][mdates[`:AutoDateLocator][]];
    plt[`:xticks][;][;][(`rotation;45)];
    plt[`:gcf][][`:autofmt_xdate][];  
 }



// LAS FUNCIONES PARA REPRESENTAR LAS GRÁFICAS

historical_g:{[ETF]
    plt[`:clf][];
    plt[`:figure][(`figsize);(22;14)]; 

    plt[`:plot][ax_x[ETF];ax_y[ETF];"y-"];
    plt[`:plot][aSMA_x[ETF];aSMA_y[ETF];"r-"];
    plt[`:plot][aMSMA_x[ETF];aMSMA_y[ETF];"g-"];

    format[];
    name: string ETF;
    hist_legend[name;-1];    
    plt[`:savefig]["Data/DataWarehouse/Images/Hist/",name,".png"];

 };


historical_g_F:{[ETF;DATE]
    plt[`:clf][];
    plt[`:figure][(`figsize);(22;14)]; 

    plt[`:plot][ax_x_F[ETF;DATE];ax_y_F[ETF;DATE];"y-"];
    plt[`:plot][aSMA_x_F[ETF;DATE];aSMA_y_F[ETF;DATE];"r-"];
    plt[`:plot][aMSMA_x_F[ETF;DATE];aMSMA_y_F[ETF;DATE];"g-"];

    format[];
    name: string ETF;
    hist_legend[name;DATE];
    plt[`:savefig]["Data/DataWarehouse/Images/Hist/",name,"-",(string DATE),".png"];

 };

in_outflow_g:{[ETF]
    plt[`:clf][];
    plt[`:figure][(`figsize);(14;10)];

    plt[`:plot][in_out_x[ETF];in_out_y[ETF]; "b-o"];
    plt[`:axhline][(0)];
    
    format[];
    name: string ETF;
    in_out_legend[name;-1];
    plt[`:savefig]["Data/DataWarehouse/Images/Inflow-Outflow/",name,".png"];
 }

in_outflow_g_F:{[ETF;DATE]
    plt[`:clf][];
    plt[`:figure][(`figsize);(14;10)];
    
    plt[`:plot][in_out_x_F[ETF;DATE];in_out_y_F[ETF;DATE]; "b-o"];
    plt[`:axhline][(0)];

    format[];
    name: string ETF;
    in_out_legend[name;DATE];
    plt[`:savefig]["Data/DataWarehouse/Images/Inflow-Outflow/",name,"-",(string DATE),".png"];

 }