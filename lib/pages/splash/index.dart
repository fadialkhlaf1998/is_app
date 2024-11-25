import 'package:is_app/res/images.dart';
import 'package:is_app/widgets/custom_png_pic/custom_png_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: Get.width,
        height: Get.height,
        child: Lottie.asset(
          splashScreenAnimation,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
