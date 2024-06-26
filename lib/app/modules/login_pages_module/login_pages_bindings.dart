import 'package:aspinwal/app/modules/login_pages_module/login_pages_controller.dart';
import 'package:get/get.dart';



class LoginPagesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginPagesController());
  }
}