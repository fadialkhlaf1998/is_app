import 'package:is_app/pages/styles_details/controller.dart';

import 'package:get/get.dart';

class StylesDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(StylesDetailsController());
  }
}
