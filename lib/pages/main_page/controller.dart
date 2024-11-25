import 'package:is_app/controller/app_storage.dart';
import 'package:is_app/controller/init_controller.dart';
import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/res/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MainPageController extends GetxController {
  final pageController = PageController(initialPage: 0);
  final InitController initController = Get.find();
  RxInt pageIndex = 0.obs;

  bool backButtonStatus = false;
  DateTime timeBackPressed = DateTime.now();

  moveBetweenPages(index) async {
    if (index == 3) {
      initController.showBadge.value = false;
      AppStorage.saveBadgeStatus(false);
    }
    pageIndex.value = index;
    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 600),
        curve: Curves.fastOutSlowIn);
  }

  Future<bool> backButton(BuildContext context) async {
    if (pageIndex.value != 0) {
      moveBetweenPages(0);
      return false;
    } else {
      final difference = DateTime.now().difference(timeBackPressed);
      final isExitWarning = difference >= const Duration(seconds: 2);
      timeBackPressed = DateTime.now();
      if (isExitWarning) {
        Fluttertoast.showToast(
            msg: context.localizations.press_back_to_exit,
            fontSize: 14,
            textColor: black,
            backgroundColor: primaryColor.withOpacity(0.5));
        return false;
      } else {
        Fluttertoast.cancel();
        return true;
      }
    }
  }
}
