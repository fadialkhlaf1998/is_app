import 'package:is_app/pages/order_details/controller.dart';
import 'package:get/get.dart';

class OrderDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(OrderDetailsController());
  }
}
