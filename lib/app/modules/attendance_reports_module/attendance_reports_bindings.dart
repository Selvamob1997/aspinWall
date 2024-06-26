
import 'package:aspinwal/app/modules/attendance_reports_module/attendance_reports_controller.dart';
import 'package:get/get.dart';


class AttendanceReportsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AttendanceReportsController());
  }
}