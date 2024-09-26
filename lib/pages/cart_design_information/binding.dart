import 'package:is_app/pages/cart_design_information/controller.dart';
import 'package:get/get.dart';

class CartDesignInfoBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(CartDesignInfoController());
  }
}
