
import 'package:aspinwal/app/modules/clientvisit_reports_module/clientvisit_reports_controller.dart';
import 'package:get/get.dart';



class ClientvisitReportsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ClientvisitReportsController());
  }
}