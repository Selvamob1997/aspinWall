
import 'package:aspinwal/app/modules/permision_reports_module/permision_reports_controller.dart';
import 'package:get/get.dart';


class PermisionReportsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PermisionReportsController());
  }
}