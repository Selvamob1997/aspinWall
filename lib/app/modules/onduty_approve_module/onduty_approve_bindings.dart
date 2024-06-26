
import 'package:aspinwal/app/modules/onduty_approve_module/onduty_approve_controller.dart';
import 'package:get/get.dart';



class OndutyApproveBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OndutyApproveController());
  }
}