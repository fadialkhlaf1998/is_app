import 'package:is_app/res/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

class LoadingMoodboardList extends StatelessWidget {
  const LoadingMoodboardList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: Get.width,
      height: Get.height * 0.06,
      child: ListView.builder(
        itemCount: 3,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, index) {
          return Shimmer.fromColors(
            baseColor: loadingColor1,
            highlightColor: loadingColor2,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 7),
              width: Get.height * 0.06,
              height: Get.height * 0.06,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle, color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}
