import 'package:is_app/controller/constant.dart';
import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/login/controller.dart';
import 'package:is_app/pages/login/widgets/login_text_fields.dart';
import 'package:is_app/pages/login/widgets/not_have_account_option.dart';
import 'package:is_app/res/color.dart';
import 'package:is_app/res/images.dart';
import 'package:is_app/res/styles.dart';
import 'package:is_app/widgets/app_bar/back_app_bar.dart';
import 'package:is_app/widgets/button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);
  final LoginController loginController = Get.find();

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
                color: Colors.transparent,
                width: Get.width,
                height: Get.height - Constant.removeSpaces(context),
                child: Center(
                  child: Container(
                    height: 380,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.localizations.login,
                          style: textStyleForTitle,
                        ),
                        LoginTextFields(),
                        NotHaveAccountOption(),
                        CustomButton(
                            width: 0.9,
                            height: 0.055,
                            color: primaryColor,
                            loading: loginController.loading.value,
                            title: context.localizations.login,
                            onTap: () async {
                              await loginController.loginRequest(context);
                            },
                            textStyle: textStyleForButton),
                        SizedBox(height: Get.height * 0.05),
                      ],
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
