
import 'package:aspinwal/app/modules/attendance_page_module/attendance_page_controller.dart';
import 'package:get/get.dart';



class AttendancePageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AttendancePageController());
  }
}