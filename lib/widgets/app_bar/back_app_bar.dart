import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BackAppBar extends StatelessWidget {
  const BackAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * 0.07,
      child: Align(
        alignment: Alignment.centerLeft,
        child: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            width: Get.width * 0.15,
            child: Center(
              child: Icon(Icons.arrow_back),
            ),
          ),
        ),
      ),
    );
  }
}
