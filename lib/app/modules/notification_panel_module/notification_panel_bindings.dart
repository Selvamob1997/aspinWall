
import 'package:aspinwal/app/modules/notification_panel_module/notification_panel_controller.dart';
import 'package:get/get.dart';



class NotificationPanelBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NotificationPanelController());
  }
}