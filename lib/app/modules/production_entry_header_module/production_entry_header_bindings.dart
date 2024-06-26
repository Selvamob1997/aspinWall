import 'package:aspinwal/app/modules/production_entry_header_module/production_entry_header_controller.dart';
import 'package:get/get.dart';



class ProductionEntryHeaderBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductionEntryHeaderController());
  }
}