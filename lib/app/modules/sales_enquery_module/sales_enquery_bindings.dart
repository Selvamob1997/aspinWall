import 'package:aspinwal/app/modules/sales_enquery_module/sales_enquery_controller.dart';
import 'package:get/get.dart';


class SalesEnqueryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SalesEnqueryController());
  }
}