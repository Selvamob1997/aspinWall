
import 'package:aspinwal/app/modules/onduty_master_module/onduty_master_controller.dart';
import 'package:get/get.dart';



class OndutyMasterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OndutyMasterController());
  }
}