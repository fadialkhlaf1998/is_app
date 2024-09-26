import 'package:is_app/controller/init_controller.dart';
import 'package:is_app/res/color.dart';
import 'package:is_app/res/images.dart';
import 'package:is_app/res/styles.dart';
import 'package:is_app/widgets/custom_svg_pic/custom_svg_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileHeader extends StatelessWidget {
  ProfileHeader({Key? key}) : super(key: key);
  final InitController initController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.15,
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: const BorderRadius.only(
          bottomRight: Radius.circular(25),
          bottomLeft: Radius.circular(25),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 20, right: 10),
            height: Get.height * 0.08,
            width: Get.height * 0.08,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: CustomSvgImage(
              height: Get.height * 0.08,
              width: Get.height * 0.08,
              image: USER_IMAGE,
            ),
          ),
          initController.checkUserIfLogin()
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      initController.userData.fullName.toString(),
                      style: textStyleForNormalText,
                    ),
                    Text(
                      initController.userData.email.toString(),
                      style: textStyleForNormalText,
                    ),
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
