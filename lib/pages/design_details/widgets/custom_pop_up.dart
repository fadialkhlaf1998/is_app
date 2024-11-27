import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/design_details/controller.dart';
import 'package:is_app/res/color.dart';
import 'package:is_app/res/styles.dart';
import 'package:is_app/widgets/button/custom_button.dart';

class CustomContinuePopUp extends StatelessWidget {
   CustomContinuePopUp({super.key});
  final DesignDetailsController designDetailsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.9,
      height: Get.height * 0.23,
      decoration: BoxDecoration(
        color: white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 10,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Text(
            context.localizations.design_add_to_cart_success,
            textAlign: TextAlign.center,
            style: textStyleForListTitle,
          ),
          Row(
            children: [
              CustomButton(
                  width: 0.45,
                  height: 0.06,
                  color: secondaryColor,
                  title: context.localizations.continue_shopping,
                  onTap:(){
                    designDetailsController.noOption();
                  },
                  borderRadiusBottomLeft: 20,
                  borderRadiusBottomRight: 0,
                  borderRadiusTopLeft: 0,
                  borderRadiusTopRight: 0,
                  textStyle: textStyleForNormalColorText),
             Obx((){
               return  CustomButton(
                   width: 0.45,
                   height: 0.06,
                   color: primaryColor,
                   borderRadiusBottomLeft: 0,
                   borderRadiusBottomRight: 20,
                   borderRadiusTopLeft: 0,
                   borderRadiusTopRight: 0,
                   title: context.localizations.go_to_cart,
                   loading: designDetailsController.goLoading.value,
                   onTap:()async {
                     await designDetailsController.goOption();
                   },
                   textStyle: textStyleForNormalText);
             }),
            ],
          ),
        ],
      ),
    );
  }
}
