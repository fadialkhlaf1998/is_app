import 'package:is_app/data/models/body/cart/cart_body.dart';
import 'package:is_app/data/models/response/guest/design_details_response.dart';
import 'package:is_app/data/repository/cart_repo.dart';
import 'package:is_app/data/repository/guest_repo.dart';
import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/cart/controller.dart';
import 'package:is_app/pages/home_page/controller.dart';
import 'package:is_app/widgets/snack_bar/top_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DesignDetailsController extends GetxController {
  GuestRepo guestRepo = GuestRepo();
  CartRepo cartRepo = CartRepo();
  CartController cartController = Get.find();

  // final CategoryDetailsController categoryDetailsController = Get.find();
  final HomeController homeController = Get.find();
  DesignResponse selectDesignDetails = DesignResponse();
  List<String> designImages = <String>[];

  RxInt currentImageSliderIndex = 0.obs;
  RxBool loading = false.obs;
  RxBool loadingAdd = false.obs;

  getDesignDetailsRequest() async {
    loading.value = true;
    await guestRepo
        .getDesignDetails(homeController.selectDesignId.value.toString())
        .then((value) {
      if (value.code == 1) {
        selectDesignDetails =
            DesignResponse.fromJson(value.data['design_details']);
        designImages.addAll(selectDesignDetails.images!.split(','));
        loading.value = false;
      } else {
        loading.value = false;
        print('sometinng wrong');
      }
    });
  }

  addToCartRequest(BuildContext context, id) async {
    print('_________');
    print(id);
    print('_________');
    if (!loading.value) {
      loadingAdd.value = true;
      cartRepo
          .addToCart(CartBody(
              designId: int.parse(id.toString()),
              width: 0,
              height: 0,
              length: 0,
              note: ''))
          .then((value) {
        if (value.code == 1) {
          print('*********');
          print(value.data["insertId"]);
          loadingAdd.value = false;
          // Get.back();
          cartController.getCartItemDetailsFromDesign(selectDesignDetails,value.data["insertId"]);
          Get.toNamed('/cartDesignInfo');
          TopSnackBar.success(
              context, context.localizations.add_to_cart_success);
        } else {
          loadingAdd.value = false;
          TopSnackBar.warning(context, context.localizations.something_wrong);
        }
      });
    }
  }

  @override
  void onInit() {
    getDesignDetailsRequest();
    super.onInit();
  }
}
