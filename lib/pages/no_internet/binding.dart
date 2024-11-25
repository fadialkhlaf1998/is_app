import 'package:get/get.dart';
import 'package:is_app/pages/no_internet/controller.dart';

class NoInternetBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(NoInternetController());
  }
}
