import 'package:carousel_slider/carousel_controller.dart';
import 'package:is_app/controller/app_storage.dart';
import 'package:is_app/controller/init_controller.dart';
import 'package:is_app/data/models/body/cart/cart_body.dart';
import 'package:is_app/data/models/response/cart/cart_response.dart';
import 'package:is_app/data/models/response/guest/design_details_response.dart';
import 'package:is_app/data/repository/cart_repo.dart';
import 'package:is_app/data/repository/guest_repo.dart';
import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/cart/controller.dart';
import 'package:is_app/pages/home_page/controller.dart';
import 'package:is_app/pages/main_page/controller.dart';
import 'package:is_app/widgets/snack_bar/top_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class DesignDetailsController extends GetxController {
  GuestRepo guestRepo = GuestRepo();
  CartRepo cartRepo = CartRepo();
  CartController cartController = Get.find();
  MainPageController mainPageController = Get.find();

  CarouselSliderController carouselSliderController =
      CarouselSliderController();

  final InitController initController = Get.find();
  final HomeController homeController = Get.find();
  DesignResponse selectDesignDetails = DesignResponse();
  RxList<String> designImages = <String>[].obs;
  Rx<Moodboards> chosenMoodboardData = Moodboards().obs;
  RxInt insertId = 0.obs;

  RxInt currentImageSliderIndex = 0.obs;
  RxBool loading = false.obs;
  RxBool loadingAdd = false.obs;
  RxBool showContinuePopUp = false.obs;
  RxBool goLoading = false.obs;
  RxInt chosenMoodboardDesignId = (-1).obs;

  getDesignDetailsRequest() async {
    loading.value = true;
    await guestRepo
        .getDesignDetails(homeController.selectDesignId.value.toString())
        .then((value) {
      if (value.code == 1) {
        selectDesignDetails =
            DesignResponse.fromJson(value.data['design_details']);
        designImages.addAll(selectDesignDetails.allImages!.split(','));
        loading.value = false;
      } else {
        loading.value = false;
        print('sometinng wrong');
      }
    });
  }

  choseMoodboard(index, BuildContext context) {
    if (selectDesignDetails.allImages!.isEmpty ||
        selectDesignDetails.allImages == null) {
      TopSnackBar.warning(context, context.localizations.no_option);
    } else {
      designImages.clear();
      chosenMoodboardData.value = Moodboards();
      if (chosenMoodboardDesignId.value ==
          selectDesignDetails.moodboards![index].moodboardDesignId) {
        chosenMoodboardDesignId.value = -1;
        designImages.addAll(selectDesignDetails.allImages!.split(','));
        currentImageSliderIndex.value = 0;
      } else {
        chosenMoodboardDesignId.value =
            selectDesignDetails.moodboards![index].moodboardDesignId ?? -1;
        designImages
            .addAll(selectDesignDetails.moodboards![index].images!.split(','));
        currentImageSliderIndex.value = 0;
        chosenMoodboardData.value = selectDesignDetails.moodboards![index];
      }
      WidgetsBinding.instance.addPostFrameCallback((_) {
        carouselSliderController.animateToPage(0);
      });
    }

    print(chosenMoodboardDesignId.value);
  }

  addToCartRequest(BuildContext context) async {
    if (chosenMoodboardDesignId.value == -1) {
      TopSnackBar.warning(context, context.localizations.must_chose_moodboard);
    } else {
      print('_________');
      print(selectDesignDetails.designId);
      print(chosenMoodboardDesignId);
      print('_________');
      if (!loading.value) {
        loadingAdd.value = true;
        cartRepo
            .addToCart(CartBody(
                designId: int.parse(selectDesignDetails.designId.toString()),
                width: 0,
                height: 0,
                length: 0,
                moodboardDesignId:
                    int.parse(chosenMoodboardDesignId.toString()),
                note: ''))
            .then((value) async {
          if (value.code == 1) {
            print('*********');
            print(value.data["insertId"]);
            loadingAdd.value = false;
            insertId.value = value.data["insertId"];
            await AppStorage.saveBadgeStatus(true);
            initController.showBadge.value = true;

            /// --------------
            showContinuePopUp.value = true;

            /// -------------
            // TopSnackBar.success(
            //     context, context.localizations.add_to_cart_success);
          } else {
            loadingAdd.value = false;
            TopSnackBar.warning(context, context.localizations.something_wrong);
          }
        });
      }
    }
  }

  noOption() {
    cartController.getCartItemDetailsFromDesign(
        selectDesignDetails, insertId.value, chosenMoodboardData.value);
    Get.offNamed('/cartDesignInfo');
  }

  goOption() async {
    goLoading.value = true;
    await cartController.getCartRequest().then((value) async {
      print('------> $value');
      Get.back();
      await mainPageController.moveBetweenPages(3, false);
      goLoading.value = false;
    });
  }

  @override
  void onInit() {
    getDesignDetailsRequest();
    super.onInit();
  }
}
