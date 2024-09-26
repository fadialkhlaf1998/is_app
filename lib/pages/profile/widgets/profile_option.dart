import 'package:is_app/pages/profile/controller.dart';
import 'package:is_app/res/color.dart';
import 'package:is_app/res/styles.dart';
import 'package:is_app/widgets/custom_svg_pic/custom_svg_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileOption extends StatelessWidget {
  final String icon;
  final String title;
  final int index;
  final ProfileController profileController = Get.find();

  ProfileOption(
      {required this.icon, required this.title, required this.index, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        profileController.profileOptionOnTap(index);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
        width: Get.width,
        height: Get.height * 0.06,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(right: 5),
                  width: Get.height * 0.06,
                  height: Get.height * 0.06,
                  decoration:
                      BoxDecoration(shape: BoxShape.circle, color: white2),
                  child: Center(
                    child: CustomSvgImage(
                      width: 20,
                      height: 20,
                      image: icon,
                      color: index == 5 ? Colors.red : black,
                    ),
                  ),
                ),
                Text(
                  title,
                  style: index == 5
                      ? textStyleForListRedTitle
                      : textStyleForListTitle,
                ),
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: black,
              size: 15,
            )
          ],
        ),
      ),
    );
  }
}
