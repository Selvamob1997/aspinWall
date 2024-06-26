
import 'package:aspinwal/app/modules/dash_board_reports_module/dash_board_reports_controller.dart';
import 'package:get/get.dart';


class DashBoardReportsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DashBoardReportsController());
  }
}