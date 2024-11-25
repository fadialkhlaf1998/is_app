import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Constant {
  static double paddingSpace = Get.width * 0.05;
  static double border = 20;

  static closeKeyBoard() {
    FocusManager.instance.primaryFocus?.unfocus();
  }

  static removeSpaces(context) {
    return (MediaQuery.of(context).padding.bottom +
        MediaQuery.of(context).padding.top);
  }

  static checkKeyBoard(context) {
    return MediaQuery.of(context).viewInsets.bottom == 0;
  }

  static numberFormat(number) {
    NumberFormat formatter = NumberFormat.decimalPatternDigits(
      locale: 'en_us',
      decimalDigits: 0,
    );
    return formatter.format(double.parse(number ?? '0')) + ' SAR';
  }

  static dateFormat(date) {
    DateTime dateTime = DateTime.parse(date);
    String formattedDate = DateFormat('d MMMM yyyy').format(dateTime);
    return formattedDate;
  }

  static isEnglish() {
    if (Get.locale!.languageCode == "en") {
      return true;
    } else {
      return false;
    }
  }
}
