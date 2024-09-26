import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/res/color.dart';
import 'package:is_app/res/images.dart';
import 'package:is_app/res/styles.dart';
import 'package:is_app/widgets/custom_svg_pic/custom_svg_image.dart';
import 'package:is_app/widgets/guest/login_now_action.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartGuest extends StatelessWidget {
  const CartGuest({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height,
      width: Get.width,
      decoration: const BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover, image: AssetImage(SING_UP_BACKGROUND))),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: Get.width * 0.95,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  context.localizations.my_cart,
                  style: textStyleForTitle,
                ),
              ),
              LoginNowAction(
                text: context.localizations.login_now,
                icon: CustomSvgImage(
                    width: 25, height: 25, image: CART, color: primaryColor),
              ),
              SizedBox(height: Get.height * 0.4)
            ],
          ),
        ],
      ),
    );
  }
}
