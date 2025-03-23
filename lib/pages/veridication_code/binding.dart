import 'package:is_app/pages/sign_up/controller.dart';
import 'package:get/get.dart';
import 'package:is_app/pages/veridication_code/controller.dart';

class VerificationCodeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(VerificationCodeController());
  }
}
