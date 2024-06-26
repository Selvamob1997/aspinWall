
import 'package:aspinwal/app/modules/enquery_screen_module/enquery_screen_controller.dart';
import 'package:get/get.dart';
//import 'package:litiz_bang/app/modules/enquery_screen_module/enquery_screen_controller.dart';


class EnqueryScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => EnqueryScreenController());
  }
}