
import 'package:aspinwal/app/modules/site_visit_reports_module/site_visit_reports_controller.dart';
import 'package:get/get.dart';


class SiteVisitReportsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SiteVisitReportsController());
  }
}