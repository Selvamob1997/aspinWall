
import 'package:aspinwal/app/modules/production_entry_module/production_entry_controller.dart';
import 'package:get/get.dart';



class ProductionEntryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ProductionEntryController());
  }
}