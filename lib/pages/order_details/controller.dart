import 'package:get/get.dart';
import 'package:is_app/data/models/response/profile/order_details_response.dart';
import 'package:is_app/data/repository/profile_repo.dart';
import 'package:is_app/pages/order_history/controller.dart';

class OrderDetailsController extends GetxController {
  ProfileRepo profileRepo = ProfileRepo();

  OrderHistoryController orderHistoryController = Get.find();
  OrderDetailsResponse? orderDetailsResponse;

  RxBool loading = true.obs;

  getData() async {
    loading.value = true;
    await profileRepo
        .getOrderDetails(orderHistoryController.selectedOrder.toString())
        .then((value) {
      if (value.code == 1) {
        print(value.data);
        orderDetailsResponse =
            OrderDetailsResponse.fromJson(value.data['order_details']);
        loading.value = false;
      } else {
        loading.value = false;
        Get.back();
      }
    });
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    print('************');
    print(loading.value);
    getData();
    print('************');
    print(loading.value);
  }
}
