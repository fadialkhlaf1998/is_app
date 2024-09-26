import 'package:is_app/pages/personal_info_details/controller.dart';
import 'package:get/get.dart';

class PersonalInfoDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PersonalInfoDetailsController());
  }
}
