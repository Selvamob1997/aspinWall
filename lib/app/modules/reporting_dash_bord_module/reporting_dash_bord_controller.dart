import 'package:get/get.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
/**
 * GetX Template Generator - fb.com/htngu.99
 * */

class ReportingDashBordController extends GetxController{

  late TooltipBehavior tooltip;
  late List<TradingList> tradingData;
  late List<MfgList> mfgData;
  late List<ServiceList> serviceData;


  @override
  void onInit() {


    tradingData = [
      TradingList('Target', 500000),
      TradingList('Achived', 400000),
      TradingList('Shortfall', 100000),
    ];
    mfgData = [
      MfgList('Target', 200000),
      MfgList('Achived', 170000),
      MfgList('Shortfall', 30000),
    ];
    serviceData = [
      ServiceList('Target', 350000),
      ServiceList('Achived', 345000),
      ServiceList('Shortfall', 5000),
    ];

    tooltip = TooltipBehavior(enable: true);
    // TODO: implement onInit
    super.onInit();
  }
}


class TradingList {
  TradingList(this.x, this.y);

  final String x;
  final double y;
}

class MfgList {
  MfgList(this.x, this.y);

  final String x;
  final double y;
}

class ServiceList {
  ServiceList(this.x, this.y);

  final String x;
  final double y;
}
