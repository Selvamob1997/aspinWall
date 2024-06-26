import 'package:aspinwal/app/modules/telecalling_module/telecalling_controller.dart';
import 'package:get/get.dart';


class TelecallingBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TelecallingController());
  }
}