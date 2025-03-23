import 'package:is_app/controller/constant.dart';
import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/sign_up/controller.dart';
import 'package:is_app/pages/sign_up/widgets/have_account_option.dart';
import 'package:is_app/pages/veridication_code/controller.dart';
import 'package:is_app/widgets/app_bar/back_app_bar.dart';
import 'package:is_app/pages/sign_up/widgets/text_fields.dart';
import 'package:is_app/res/color.dart';
import 'package:is_app/res/images.dart';
import 'package:is_app/res/styles.dart';
import 'package:is_app/widgets/button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:is_app/widgets/text_field/custom_text_field.dart';

class VerificationCodePage extends StatelessWidget {
  VerificationCodePage({Key? key}) : super(key: key);
  final VerificationCodeController verificationCodeController = Get.put(VerificationCodeController());

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        body: SafeArea(
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              Container(
                width: Get.width,
                height: Get.height - Constant.removeSpaces(context),
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage(SING_UP_BACKGROUND))),
              ),
              Container(
                width: Get.width,
                height: Get.height - Constant.removeSpaces(context),
                color: Colors.transparent,
                child: Center(
                  child: SingleChildScrollView(
                    child: Container(
                      width: Get.width,
                      height: 250,
                      padding: EdgeInsets.symmetric(
                          horizontal: Constant.paddingSpace),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.localizations.verification_code,
                            style: textStyleForTitle,
                          ),
                          SizedBox(
                            height: 50,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomTextField(
                                  width: 0.9,
                                  height: 0.055,
                                  labelText: context.localizations.verification_code,
                                  textInputType: TextInputType.text,
                                  controller: verificationCodeController.code,
                                ),
                              ],
                            ),
                          ),

                          CustomButton(
                              width: 0.9,
                              height: 0.055,
                              color: primaryColor,
                              title: context.localizations.verify,
                              loading: verificationCodeController.loading.value,
                              onTap: () async {
                                await verificationCodeController.verificationCodeRequest(context);
                              },
                              textStyle: textStyleForButton),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              BackAppBar()
            ],
          ),
        ),
      );
    });
  }
}
