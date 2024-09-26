import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/profile/controller.dart';
import 'package:is_app/res/color.dart';
import 'package:is_app/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageBottomSheet extends StatelessWidget {
  LanguageBottomSheet({Key? key}) : super(key: key);
  final ProfileController profileController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: profileController.languageOpenMenu.value
                ? GestureDetector(
                    onTap: () {
                      profileController.languageOpenMenu.value = false;
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
            bottom: profileController.languageOpenMenu.value
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
                          context.localizations.change_language,
                          style: textStyleForListTitle,
                        ),
                        Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 25, horizontal: Get.width * 0.05),
                            child: Column(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    profileController.chooseLanguage('en');
                                  },
                                  child: Container(
                                    color: Colors.transparent,
                                    child: Row(
                                      children: [
                                        profileController.englishStatus.value
                                            ? Icon(Icons.radio_button_checked,
                                                color: primaryColor)
                                            : Icon(Icons.radio_button_off,
                                                color: grey),
                                        const SizedBox(width: 10),
                                        Text(
                                          context.localizations.english,
                                          style: textStyleForListTitle,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(height: 20),
                                GestureDetector(
                                  onTap: () {
                                    profileController.chooseLanguage('ar');
                                  },
                                  child: Container(
                                    color: Colors.transparent,
                                    child: Row(
                                      children: [
                                        profileController.arabicStatus.value
                                            ? Icon(Icons.radio_button_checked,
                                                color: primaryColor)
                                            : Icon(Icons.radio_button_off,
                                                color: grey),
                                        const SizedBox(width: 10),
                                        Text(
                                          context.localizations.arabic,
                                          style: textStyleForListTitle,
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ))
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
