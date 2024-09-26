import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/profile/controller.dart';
import 'package:is_app/res/color.dart';
import 'package:is_app/res/styles.dart';
import 'package:is_app/widgets/button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteAccountBottomSheet extends StatelessWidget {
  DeleteAccountBottomSheet({Key? key}) : super(key: key);
  final ProfileController profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: profileController.deleteAccountOpenMenu.value
                ? GestureDetector(
                    onTap: () {
                      profileController.deleteAccountOpenMenu.value = false;
                    },
                    child: Container(
                      key: const ValueKey('1'),
                      color: black.withOpacity(0.5),
                      width: Get.width,
                      height: Get.height,
                    ),
                  )
                : SizedBox(
                    key: const ValueKey('2'),
                    width: Get.width,
                    height: Get.height),
          ),
          AnimatedPositioned(
            bottom: profileController.deleteAccountOpenMenu.value
                ? 0
                : -Get.height * 0.55,
            duration: const Duration(milliseconds: 700),
            curve: Curves.fastOutSlowIn,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(25),
                    topRight: Radius.circular(25),
                  ),
                  color: white),
              width: Get.width,
              padding: EdgeInsets.only(bottom: Get.height * 0.02, top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(bottom: 20),
                          width: Get.width * 0.25,
                          height: 4,
                          decoration: BoxDecoration(
                              color: black.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(100)),
                        ),
                        Text(
                          context.localizations.want_delete_account,
                          style: textStyleForListTitle,
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        CustomButton(
                            width: 0.8,
                            height: 0.045,
                            color: white,
                            title: context.localizations.cancel,
                            onTap: () {
                              profileController.deleteAccountOpenMenu.value =
                                  false;
                            },
                            border: Border.all(color: primaryColor),
                            textStyle: textStyleForWhiteButton),
                        const SizedBox(
                          height: 15,
                        ),
                        CustomButton(
                            width: 0.8,
                            height: 0.045,
                            color: white,
                            title: context.localizations.delete_account,
                            onTap: () {
                              profileController.deleteAccountRequest(context);
                            },
                            border: Border.all(color: Colors.red),
                            textStyle: textStyleForRedButton),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }
}
