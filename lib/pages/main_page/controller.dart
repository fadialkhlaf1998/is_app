import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/res/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:fluttertoast/fluttertoast.dart';

class MainPageController extends GetxController {
  final pageController = PageController(initialPage: 0);
  RxInt pageIndex = 0.obs;

  bool backButtonStatus = false;
  DateTime timeBackPressed = DateTime.now();

  moveBetweenPages(index) async {
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
            backgroundColor: primaryColor);
        return false;
      } else {
        Fluttertoast.cancel();
        return true;
      }
    }
  }
}
