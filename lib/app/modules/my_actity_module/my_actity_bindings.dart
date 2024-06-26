
import 'package:aspinwal/app/modules/my_actity_module/my_actity_controller.dart';
import 'package:get/get.dart';


class MyActityBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyActityController());
  }
}