IMPORT $,Visualizer;

//  Aggregate by Ship_Mode ---
// OUTPUT(TABLE(Sales.CleanDataset, {Ship_Mode, UNSIGNED INTEGER4 Sum_Order_Quantity := SUM(GROUP, Order_Quantity)}, Ship_Mode, FEW), NAMED('Ship_Mode'));
// Visualizer.MultiD.Column('myColumnChart',, 'Ship_Mode',,, DATASET([{'xAxisFocus', false}], Visualizer.KeyValueDef));

 // Aggregate by Order_Priority ---
// OUTPUT(TABLE(Sales.CleanDataset, {Order_Priority, UNSIGNED INTEGER4 SumOrderQuantity := SUM(GROUP, Order_Quantity)}, Order_Priority, FEW), NAMED('Order_Priority'));
// Visualizer.TwoD.Pie('myPieChart',, 'Order_Priority');

 // Aggregate by Region ---
// OUTPUT(TABLE(Sales.CleanDataset, {Region, UNSIGNED INTEGER4 SumOrderQuantity := SUM(GROUP, Order_Quantity)}, Region, FEW), NAMED('Region'));
// Visualizer.MultiD.Bar('myBarChart',, 'Region');

 // All data filtered by previous visualizations ---
// mappings :=  DATASET([  {'Date', 'Fixed_Order_Date'}, 
                        // {'Unit Price', 'Unit_Price'}, 
                        // {'Shipping Cost', 'Shipping_Cost'}], Visualizer.KeyValueDef);

// filter := DATASET([     {'myColumnChart', [{'Ship_Mode', 'Ship_Mode'}]},
                        // {'myPieChart', [{'Order_Priority', 'Order_Priority'}]},
                        // {'myBarChart', [{'Region', 'Region'}]}], Visualizer.FiltersDef);

// properties := DATASET([ {'xAxisType', 'time'}, 
                        // {'xAxisTypeTimePattern', '%Y-%m-%d'}, 
                        // {'xAxisFocus', true},
                        // {'interpolate', 'cardinal'}
                        // ], Visualizer.KeyValueDef);

// Visualizer.MultiD.Area('myLine', 'http://192.168.3.22:8002/WsEcl/submit/query/roxie/sales', 'Sales', mappings, filter, properties);

//  Output "2D" dataset:  "Region" v "sum of Profit"
// OUTPUT(TABLE(Sales.CleanDataset, {Region, UNSIGNED INTEGER4 Sum_Profit := SUM(GROUP, Profit)}, Region, FEW), NAMED('Tabela'));
OUTPUT(mytable, NAMED('Tabela'));
filter := DATASET([ [{'block', 'block'}]], Visualizer.FiltersDef);

//  Create the visualization, giving it a uniqueID "bubble" and supplying the result name "RegionProfit_Viz"
Visualizer.MultiD.column('myChart', 'http://192.168.56.101:8002/WsEcl/submit/query/roxie/fn_fetchcrimes-plr', 'Tabela', /*mappings*/, filter, /*dermatologyProperties*/ );
