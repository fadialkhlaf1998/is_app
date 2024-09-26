import 'package:is_app/controller/init_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class PersonalInfoDetailsController extends GetxController {
  TextEditingController? nameController;
  TextEditingController? emailController;
  TextEditingController? phoneController;

  final InitController initController = Get.find();

  @override
  void onInit() {
    nameController =
        TextEditingController(text: initController.userData.fullName);
    emailController =
        TextEditingController(text: initController.userData.email);
    phoneController =
        TextEditingController(text: initController.userData.phone);
    super.onInit();
  }
}
