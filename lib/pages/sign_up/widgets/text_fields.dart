import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/sign_up/controller.dart';
import 'package:is_app/res/color.dart';
import 'package:is_app/widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextFields extends StatelessWidget {
  TextFields({Key? key}) : super(key: key);
  final SignUpController signUpController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
        height: Get.height * 0.3,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomTextField(
              width: 0.9,
              height: 0.055,
              labelText: context.localizations.full_name,
              textInputType: TextInputType.text,
              controller: signUpController.fullNameController,
            ),
            CustomTextField(
              width: 0.9,
              height: 0.055,
              labelText: context.localizations.email,
              textInputType: TextInputType.emailAddress,
              controller: signUpController.emailController,
            ),
            CustomTextField(
              width: 0.9,
              height: 0.055,
              maxLines: 1,
              minLines: 1,
              obscureText: signUpController.hidePassword.value,
              suffixIcon: GestureDetector(
                onTap: () {
                  signUpController.hidePassword.value =
                      !signUpController.hidePassword.value;
                },
                child: signUpController.hidePassword.value
                    ? Icon(Icons.visibility_off, color: black)
                    : Icon(Icons.visibility, color: black),
              ),
              labelText: context.localizations.password,
              textInputType: TextInputType.visiblePassword,
              controller: signUpController.passwordController,
            ),
            CustomTextField(
              width: 0.9,
              height: 0.055,
              labelText: context.localizations.phone_number,
              textInputType: TextInputType.phone,
              controller: signUpController.phoneController,
            ),
          ],
        ),
      );
    });
  }
}
