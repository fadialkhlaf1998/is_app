import 'package:is_app/res/color.dart';
import 'package:flutter/material.dart';

import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';

class CircleLoadingContainer extends StatelessWidget {
  final double width;
  final double height;

  const CircleLoadingContainer(
      {super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: loadingColor1,
      highlightColor: loadingColor2,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        width: Get.width * width,
        height: Get.height * height,
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      ),
    );
  }
}
