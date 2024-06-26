
import 'package:aspinwal/app/modules/onduty_reports_module/onduty_reports_controller.dart';
import 'package:get/get.dart';



class OndutyReportsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OndutyReportsController());
  }
}