import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/cart_design_information/controller.dart';
import 'package:is_app/res/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageOptions extends StatelessWidget {
  ImageOptions({Key? key}) : super(key: key);
  final CartDesignInfoController cartDesignInfoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.6,
      height: Get.height * 0.16,
      padding: EdgeInsets.symmetric(vertical: 10),
      decoration:
          BoxDecoration(color: white, borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(context.localizations.chose_image),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    cartDesignInfoController.getImageFromCamera();
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt, color: primaryColor, size: 35),
                          const SizedBox(height: 5),
                          Text(context.localizations.camera),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    cartDesignInfoController.getImageFromGallery();
                  },
                  child: Container(
                    color: Colors.transparent,
                    child: Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image, color: primaryColor, size: 35),
                          const SizedBox(height: 5),
                          Text(context.localizations.gallery),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10)
        ],
      ),
    );
  }
}
