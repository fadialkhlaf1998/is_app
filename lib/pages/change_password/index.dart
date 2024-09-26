import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/change_password/controller.dart';
import 'package:is_app/res/color.dart';
import 'package:is_app/res/styles.dart';
import 'package:is_app/widgets/button/custom_button.dart';
import 'package:is_app/widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChangePasswordPage extends StatelessWidget {
  ChangePasswordPage({Key? key}) : super(key: key);
  final ChangePasswordController changePasswordController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          title: Text(
            context.localizations.change_password,
            style: textStyleForTitle,
          ),
          backgroundColor: white,
          elevation: 0.0,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
                color: Colors.transparent,
                child: Icon(Icons.arrow_back_ios_new_outlined,
                    color: black, size: 20)),
          ),
        ),
        body: SafeArea(
          child: Container(
            width: Get.width,
            height: Get.height * 0.6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: Get.height * 0.05),
                  height: Get.height * 0.28,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CustomTextField(
                          width: 0.9,
                          height: 0.055,
                          controller: changePasswordController.oldPassword,
                          labelText: context.localizations.old_password,
                          obscureText: changePasswordController.hideOld.value,
                          maxLines: 1,
                          minLines: 1,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              changePasswordController.hideOld.value =
                                  !changePasswordController.hideOld.value;
                            },
                            child: changePasswordController.hideOld.value
                                ? Icon(Icons.visibility_off, color: grey)
                                : Icon(Icons.visibility, color: grey),
                          ),
                          textInputType: TextInputType.visiblePassword),
                      CustomTextField(
                          width: 0.9,
                          height: 0.055,
                          maxLines: 1,
                          minLines: 1,
                          labelText: context.localizations.new_password,
                          controller: changePasswordController.newPassword,
                          obscureText: changePasswordController.hideNew.value,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              changePasswordController.hideNew.value =
                                  !changePasswordController.hideNew.value;
                            },
                            child: changePasswordController.hideNew.value
                                ? Icon(Icons.visibility_off, color: grey)
                                : Icon(Icons.visibility, color: grey),
                          ),
                          textInputType: TextInputType.visiblePassword),
                      CustomTextField(
                          width: 0.9,
                          height: 0.055,
                          maxLines: 1,
                          minLines: 1,
                          controller:
                              changePasswordController.confirmNewPassword,
                          labelText: context.localizations.confirm_password,
                          obscureText:
                              changePasswordController.hideConfirm.value,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              changePasswordController.hideConfirm.value =
                                  !changePasswordController.hideConfirm.value;
                            },
                            child: changePasswordController.hideConfirm.value
                                ? Icon(Icons.visibility_off, color: grey)
                                : Icon(Icons.visibility, color: grey),
                          ),
                          textInputType: TextInputType.visiblePassword),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: CustomButton(
                      width: 0.9,
                      height: 0.06,
                      color: primaryColor,
                      title: context.localizations.change_password,
                      loading: changePasswordController.loading.value,
                      onTap: () async {
                        await changePasswordController
                            .changePasswordRequest(context);
                      },
                      textStyle: textStyleForButton),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
