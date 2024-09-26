import 'package:is_app/controller/constant.dart';
import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/personal_info_details/controller.dart';
import 'package:is_app/res/color.dart';
import 'package:is_app/res/styles.dart';
import 'package:is_app/widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PersonalInfoDetailsPage extends StatelessWidget {
  PersonalInfoDetailsPage({Key? key}) : super(key: key);
  final PersonalInfoDetailsController personalInfoDetailsController =
      Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        title: Text(
          context.localizations.personal_info_details,
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
                  color: black, size: 20)
          ),
        ),
      ),
      body: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height * 0.7,
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
                        readOnly: true,
                        controller:
                            personalInfoDetailsController.nameController,
                        labelText: context.localizations.full_name,
                        textInputType: TextInputType.text),
                    CustomTextField(
                        width: 0.9,
                        height: 0.055,
                        readOnly: true,
                        controller:
                            personalInfoDetailsController.emailController,
                        labelText: context.localizations.email,
                        textInputType: TextInputType.emailAddress),
                    CustomTextField(
                        width: 0.9,
                        height: 0.055,
                        readOnly: true,
                        labelText: context.localizations.phone_number,
                        controller:
                            personalInfoDetailsController.phoneController,
                        textInputType: TextInputType.phone),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 20),
              //   child: CustomButton(
              //       width: 0.9,
              //       height: 0.06,
              //       color: primaryColor,
              //       title: context.localizations.update,
              //       onTap: () {},
              //       textStyle: textStyleForButton),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
