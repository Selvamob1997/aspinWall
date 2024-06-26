import 'package:aspinwal/app/modules/reimbursement_master_module/reimbursement_master_controller.dart';
import 'package:get/get.dart';

class ReimbursementMasterBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReimbursementMasterController());
  }
}