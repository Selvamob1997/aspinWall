
import 'package:aspinwal/app/modules/leavemaster_reports_module/leavemaster_reports_controller.dart';
import 'package:get/get.dart';


class LeavemasterReportsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LeavemasterReportsController());
  }
}