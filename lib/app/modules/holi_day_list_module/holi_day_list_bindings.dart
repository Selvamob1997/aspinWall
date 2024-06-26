
import 'package:aspinwal/app/modules/holi_day_list_module/holi_day_list_controller.dart';
import 'package:get/get.dart';



class HoliDayListBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HoliDayListController());
  }
}