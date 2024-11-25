import 'package:is_app/controller/constant.dart';
import 'package:is_app/controller/init_controller.dart';
import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/design_details/controller.dart';
import 'package:is_app/pages/design_details/widgets/design_info.dart';
import 'package:is_app/pages/design_details/widgets/loading_moodboard_list.dart';
import 'package:is_app/pages/design_details/widgets/moodboards_list.dart';
import 'package:is_app/pages/design_details/widgets/slider_image.dart';
import 'package:is_app/res/color.dart';
import 'package:is_app/res/styles.dart';
import 'package:is_app/widgets/button/custom_button.dart';
import 'package:is_app/widgets/loading/loading_container.dart';
import 'package:is_app/widgets/snack_bar/top_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DesignDetailsPage extends StatelessWidget {
  DesignDetailsPage({Key? key}) : super(key: key);
  final DesignDetailsController designDetailsController = Get.find();
  final InitController initController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          title: designDetailsController.loading.value
              ? const LoadingContainer(width: 0.2, height: 0.03)
              : Text(
                  Constant.isEnglish()
                      ? designDetailsController.selectDesignDetails.title
                          .toString()
                      : designDetailsController.selectDesignDetails.arTitle
                          .toString(),
                  style: textStyleForTitle,
                ),
          backgroundColor: white,
          elevation: 0.0,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
                color: Colors.transparent,
                child: Icon(Icons.arrow_back_ios_new_outlined,
                    color: black, size: 20)),
          ),
        ),
        bottomNavigationBar: Container(
          width: Get.width,
          height: Get.height * 0.09,
          decoration: BoxDecoration(
            color: white,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 3,
                blurRadius: 6,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: CustomButton(
                width: 0.7,
                height: 0.05,
                color: primaryColor,
                loading: designDetailsController.loadingAdd.value,
                title: context.localizations.add_to_cart,
                onTap: () async {
                  if (initController.checkUserIfLogin()) {
                    await designDetailsController.addToCartRequest(context);
                  } else {
                    TopSnackBar.warning(
                        context, context.localizations.must_login);
                  }
                },
                textStyle: textStyleForButton),
          ),
        ),
        body: SafeArea(
            child: SizedBox(
          height: Get.height - Constant.removeSpaces(context),
          child: GlowingOverscrollIndicator(
            showLeading: false,
            showTrailing: false,
            color: Colors.transparent,
            axisDirection: AxisDirection.down,
            child: SingleChildScrollView(
              child: Container(
                color: Colors.transparent,
                width: Get.width,
                padding: EdgeInsets.only(bottom: 20),
                // height: Get.height - (Get.height * 0.16),
                child: Column(
                  children: [
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 800),
                      child: designDetailsController.loading.value
                          ? const LoadingContainer(width: 1, height: 0.45)
                          : DesignSliderImage(),
                    ),
                    AnimatedSwitcher(
                      duration: const Duration(milliseconds: 800),
                      child: designDetailsController.loading.value
                          ? const LoadingMoodboardList()
                          : MoodboardsList(),
                    ),
                    DesignInfo(),
                  ],
                ),
              ),
            ),
          ),
        )),
      );
    });
  }
}
