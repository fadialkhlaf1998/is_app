import 'package:is_app/pages/order_history/controller.dart';
import 'package:get/get.dart';

class OrderHistoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(OrderHistoryController());
  }
}
