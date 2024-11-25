import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/contact_us/widgets/contact_section.dart';
import 'package:is_app/res/color.dart';
import 'package:is_app/res/styles.dart';
import 'package:is_app/widgets/app_bar/back_app_bar.dart';

class ContactUsPage extends StatelessWidget {
  const ContactUsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0.0,
        title: Text(context.localizations.contact_us, style: textStyleForTitle),
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: Get.width * 0.8,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: 2,
                itemBuilder: (BuildContext context, index) {
                  return ContactSection(index: index);
                },
              ),
            )
          ],
        ),
      )),
    );
  }
}
