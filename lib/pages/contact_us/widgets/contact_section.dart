import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:is_app/pages/contact_us/controller.dart';
import 'package:is_app/res/color.dart';
import 'package:is_app/res/styles.dart';
import 'package:is_app/widgets/custom_svg_pic/custom_svg_image.dart';

class ContactSection extends StatelessWidget {
  ContactSection({super.key, required this.index});
  final ContactUsController contactUsController = Get.find();
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        print(index);
        contactUsController.pressOnContactSection(index);
      },
      child: Container(
        width: Get.width * 0.8,
        height: Get.height * 0.06,
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 1,
              blurRadius: 2,
              offset: const Offset(0, 1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 10,
              height: Get.height * 0.06,
              padding: const EdgeInsets.only(right: 10),
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                  )),
            ),
            Text(
              contactUsController.contactEnTitle[index],
              style: textStyleForListTitle,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10),
              child: CustomSvgImage(
                  width: 26,
                  height: 26,
                  image: contactUsController.contactIcons[index],
                  color: primaryColor),
            ),
          ],
        ),
      ),
    );
  }
}
