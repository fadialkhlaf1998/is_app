import 'package:is_app/res/images.dart';
import 'package:is_app/widgets/custom_png_pic/custom_png_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPngImage(
                width: Get.width, height: Get.height, image: SPLASH_BACKGROUND),
            CustomPngImage(
                width: Get.width * 0.6,
                height: Get.height * 0.1,
                image: LOGO_PNG),
          ],
        ),
      ),
    );
  }
}
