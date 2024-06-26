
import 'package:aspinwal/app/modules/lead_paged_module/lead_paged_controller.dart';
import 'package:get/get.dart';



class LeadPagedBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LeadPagedController());
  }
}