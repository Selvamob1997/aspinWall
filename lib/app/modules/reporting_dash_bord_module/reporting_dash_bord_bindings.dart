
import 'package:aspinwal/app/modules/reporting_dash_bord_module/reporting_dash_bord_controller.dart';
import 'package:get/get.dart';


class ReportingDashBordBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReportingDashBordController());
  }
}