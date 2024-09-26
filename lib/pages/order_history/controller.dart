import 'package:is_app/data/models/response/profile/order_history_response.dart';
import 'package:is_app/data/repository/profile_repo.dart';
import 'package:get/get.dart';

class OrderHistoryController extends GetxController {
  ProfileRepo profileRepo = ProfileRepo();

  RxList<OrderHistoryResponse> orderHistoryList = <OrderHistoryResponse>[].obs;

  RxBool loading = false.obs;
  int selectedOrder = -1;

  getOrderHistoryRequest() async {
    loading.value = true;
    await profileRepo.getOrderHistory().then((value) {
      if (value.code == 1) {
        orderHistoryList.addAll((value.data['orders'] as List)
            .map((e) => OrderHistoryResponse.fromJson(e))
            .toList());
        loading.value = false;
      } else {
        loading.value = false;
      }
    });
  }

  checkStatus(index) {
    if (orderHistoryList[index].status == 'done') {
      return 1;
    } else if (orderHistoryList[index].status == 'pending') {
      return 2;
    } else if (orderHistoryList[index].status == 'in progress') {
      return 3;
    }
  }

  @override
  void onInit() {
    getOrderHistoryRequest();
    super.onInit();
  }
}
