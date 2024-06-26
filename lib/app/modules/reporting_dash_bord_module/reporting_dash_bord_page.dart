import 'package:aspinwal/app/modules/reporting_dash_bord_module/reporting_dash_bord_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class ReportingDashBordPage extends GetView<ReportingDashBordController> {
  @override
  Widget build(BuildContext context)=>GetBuilder<ReportingDashBordController>(builder: (myController){
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body:  Container(
          height: height/1.1,
          width: width,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Card(
                  elevation: 5,
                  color: Colors.white,
                  child: SizedBox(
                    height: height/3,
                    width: width/1.1,
                    child: SfCircularChart(
                      tooltipBehavior: myController.tooltip,
                      title: ChartTitle(text:'Trading'),
                      legend: Legend(isVisible: true,height: '150',width: '150'),
                      series: <CircularSeries>[
                        DoughnutSeries<TradingList, String>(
                            dataSource: myController.tradingData,
                            xValueMapper: (TradingList data, _) => data.x,
                            yValueMapper: (TradingList data, _) => data.y,
                            name: 'Trading',
                            dataLabelMapper: (TradingList data, _) => data.y.toString(),
                            dataLabelSettings:  const DataLabelSettings(isVisible: true)
                        )
                      ],
                    ),


                  ),
                ),
                Card(
                  elevation: 5,
                  color: Colors.white,
                  child: SizedBox(
                    height: height/2.6,
                    width: width/1.1,
                    child: SfCircularChart(
                      tooltipBehavior: myController.tooltip,
                      title: ChartTitle(text:'Mfg'),
                      legend: Legend(isVisible: true,height: '150',width: '150'),
                      series: <CircularSeries>[
                        DoughnutSeries<MfgList, String>(
                            dataSource: myController.mfgData,
                            xValueMapper: (MfgList data, _) => data.x,
                            yValueMapper: (MfgList data, _) => data.y,
                            name: 'Mfg',
                            dataLabelMapper: (MfgList data, _) => data.y.toString(),
                            dataLabelSettings:  const DataLabelSettings(isVisible: true)
                        )
                      ],
                    ),

                  ),
                ),
                Card(
                  elevation: 5,
                  color: Colors.white,
                  child: SizedBox(
                    height: height/2.6,
                    width: width/1.1,
                    child: SfCircularChart(
                      tooltipBehavior: myController.tooltip,
                      title: ChartTitle(text:'Service'),
                      legend: Legend(isVisible: true,height: '150',width: '150'),
                      series: <CircularSeries>[
                        DoughnutSeries<ServiceList, String>(
                            dataSource: myController.serviceData,
                            xValueMapper: (ServiceList data, _) => data.x,
                            yValueMapper: (ServiceList data, _) => data.y,
                            name: 'Service',
                            dataLabelMapper: (ServiceList data, _) => data.y.toString(),
                            dataLabelSettings:  const DataLabelSettings(isVisible: true)
                        )
                      ],
                    ),

                  ),
                ),

              ],
            ),
          ),
        ),

      ),
    );
  });
}
