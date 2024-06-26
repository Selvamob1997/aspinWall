
import 'package:get/get.dart';

import 'my_profile_page_controller.dart';

class MyProfilePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => MyProfilePageController());
  }
}