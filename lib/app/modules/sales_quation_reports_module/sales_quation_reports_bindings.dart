import 'package:aspinwal/app/modules/sales_quation_reports_module/sales_quation_reports_controller.dart';
import 'package:get/get.dart';


class SalesQuationReportsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SalesQuationReportsController());
  }
}