
import 'package:aspinwal/app/modules/permision_master_module/permision_master_controller.dart';
import 'package:get/get.dart';

class PermisionMasterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PermisionMasterController());
  }
}