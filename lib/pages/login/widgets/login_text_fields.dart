import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/login/controller.dart';
import 'package:is_app/res/color.dart';
import 'package:is_app/res/styles.dart';
import 'package:is_app/widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginTextFields extends StatelessWidget {
  LoginTextFields({Key? key}) : super(key: key);
  final LoginController loginController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
        height: Get.height * 0.16,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextField(
              width: 0.9,
              height: 0.055,
              // fillColor: white,
              labelText: context.localizations.email,
              textColor: black,
              controller: loginController.emailController,
              textInputType: TextInputType.emailAddress,
            ),
            CustomTextField(
              width: 0.9,
              height: 0.055,
              maxLines: 1,
              minLines: 1,
              obscureText: loginController.hidePassword.value,
              suffixIcon: GestureDetector(
                onTap: () {
                  loginController.hidePassword.value =
                      !loginController.hidePassword.value;
                },
                child: loginController.hidePassword.value
                    ? Icon(Icons.visibility_off, color: black)
                    : Icon(Icons.visibility, color: black),
              ),
              // fillColor: white,
              controller: loginController.passwordController,
              labelText: context.localizations.password,
              textInputType: TextInputType.visiblePassword,
            ),
            Container(
              width: Get.width*0.9,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: (){
                      loginController.forgotPasswordRequest(context);
                    },
                      child: Text(context.localizations.forgot_password,style: textStyleForListPrimaryText,))
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
