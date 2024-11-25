import 'package:is_app/controller/init_controller.dart';
import 'package:get/get.dart';
import 'package:is_app/controller/network_controller.dart';

class InitialBinding implements Bindings {
  @override
  void dependencies() {
    // Get.put(ApiClient());

    Get.put<NetworkController>(NetworkController());
    Get.put(InitController());
  }
}
