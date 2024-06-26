
import 'package:aspinwal/app/modules/menu_dash_module/menu_dash_controller.dart';
import 'package:get/get.dart';


class MenuDashBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MenuDashController());
  }
}