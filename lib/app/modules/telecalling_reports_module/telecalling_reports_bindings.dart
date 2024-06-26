import 'package:aspinwal/app/modules/telecalling_reports_module/telecalling_reports_controller.dart';
import 'package:get/get.dart';

class TelecallingReportsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TelecallingReportsController());
  }
}