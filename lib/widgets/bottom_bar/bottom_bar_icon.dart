import 'package:is_app/res/color.dart';
import 'package:is_app/widgets/custom_svg_pic/custom_svg_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BottomBarIcon extends StatelessWidget {
  final VoidCallback onTap;
  final String image;
  final bool select;

  const BottomBarIcon(
      {required this.onTap,
      required this.image,
      required this.select,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        // width: Get.width * 0.2,
        height: Get.height * 0.06,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomSvgImage(
                width: 22,
                height: 22,
                image: image,
                color: select ? primaryColor : lightGrey),
          ],
        ),
      ),
    );
  }
}
