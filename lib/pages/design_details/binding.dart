import 'package:is_app/pages/design_details/controller.dart';
import 'package:get/get.dart';

class DesignDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(DesignDetailsController());
  }
}
