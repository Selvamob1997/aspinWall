import 'package:aspinwal/app/modules/site_visit_module/site_visit_controller.dart';
import 'package:get/get.dart';


class SiteVisitBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SiteVisitController());
  }
}