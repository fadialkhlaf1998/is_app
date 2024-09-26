import 'package:is_app/pages/change_password/controller.dart';

import 'package:get/get.dart';

class ChangePasswordBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ChangePasswordController());
  }
}
