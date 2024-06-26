import 'package:aspinwal/app/modules/permision_approve_module/permision_approve_controller.dart';
import 'package:get/get.dart';


class PermisionApproveBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PermisionApproveController());
  }
}