import 'package:is_app/controller/constant.dart';
import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/sign_up/controller.dart';
import 'package:is_app/pages/sign_up/widgets/have_account_option.dart';
import 'package:is_app/widgets/app_bar/back_app_bar.dart';
import 'package:is_app/pages/sign_up/widgets/text_fields.dart';
import 'package:is_app/res/color.dart';
import 'package:is_app/res/images.dart';
import 'package:is_app/res/styles.dart';
import 'package:is_app/widgets/button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  final SignUpController signUpController = Get.find();

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
                      height: Get.height * 0.5,
                      padding: EdgeInsets.symmetric(
                          horizontal: Constant.paddingSpace),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.localizations.sign_up,
                            style: textStyleForTitle,
                          ),
                          TextFields(),
                          HaveAccountOption(),
                          CustomButton(
                              width: 0.9,
                              height: 0.055,
                              color: primaryColor,
                              title: context.localizations.sign_up,
                              loading: signUpController.loading.value,
                              onTap: () async {
                                await signUpController.signUpRequest(context);
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
