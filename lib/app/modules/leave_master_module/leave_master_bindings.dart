
import 'package:aspinwal/app/modules/leave_master_module/leave_master_controller.dart';
import 'package:get/get.dart';

class LeaveMasterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LeaveMasterController());
  }
}