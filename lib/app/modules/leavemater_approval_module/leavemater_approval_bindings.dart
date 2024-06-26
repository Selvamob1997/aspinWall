import 'package:aspinwal/app/modules/leavemater_approval_module/leavemater_approval_controller.dart';
import 'package:get/get.dart';


class LeavematerApprovalBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LeavematerApprovalController());
  }
}