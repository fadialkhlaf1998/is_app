import 'package:is_app/res/color.dart';
import 'package:is_app/widgets/custom_svg_pic/custom_svg_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:badges/badges.dart' as badges;

class BottomBarIcon extends StatelessWidget {
  final VoidCallback onTap;
  final String image;
  final bool select;
  final bool? badge;

  const BottomBarIcon(
      {required this.onTap,
      required this.image,
      required this.select,
      this.badge,
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
            badges.Badge(
              showBadge: badge ?? false,
              child: CustomSvgImage(
                  width: 22,
                  height: 22,
                  image: image,
                  color: select ? primaryColor : lightGrey),
            ),
          ],
        ),
      ),
    );
  }
}
