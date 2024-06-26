
import 'package:aspinwal/app/modules/reports_pages_module/reports_pages_controller.dart';
import 'package:get/get.dart';



class ReportsPagesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReportsPagesController());
  }
}