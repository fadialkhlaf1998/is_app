import 'package:is_app/extensions/context_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../res/color.dart';

class TopSnackBar {
  static success(BuildContext context, String message) {
    Get.snackbar('${context.localizations.success}!', message,
        backgroundColor: Colors.green.withOpacity(0.5),
        duration: const Duration(milliseconds: 4000),
        margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
        colorText: Colors.white);
  }

  static alert(BuildContext context, String message) {
    Get.snackbar('${context.localizations.alert}!', message,
        backgroundColor: Colors.redAccent,
        duration: const Duration(milliseconds: 4000),
        margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
        colorText: Colors.white);
  }

  static warning(BuildContext context, String message) {
    Get.snackbar('${context.localizations.warning}!', message,
        backgroundColor: grey.withOpacity(0.8),
        duration: const Duration(milliseconds: 4000),
        margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
        colorText: Colors.white);
  }
}
