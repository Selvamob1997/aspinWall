
import 'package:aspinwal/app/modules/lead_reports_module/lead_reports_controller.dart';
import 'package:get/get.dart';


class LeadReportsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LeadReportsController());
  }
}