import 'package:is_app/pages/category_details/controller.dart';

import 'package:get/get.dart';

class CategoryDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CategoryDetailsController());
  }
}
