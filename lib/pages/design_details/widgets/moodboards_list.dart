import 'package:is_app/data/constants/api_constants.dart';
import 'package:is_app/pages/design_details/controller.dart';
import 'package:is_app/res/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoodboardsList extends StatelessWidget {
  MoodboardsList({Key? key}) : super(key: key);
  final DesignDetailsController designDetailsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      width: Get.width,
      height: Get.height * 0.06,
      child: ListView.builder(
        itemCount:
            designDetailsController.selectDesignDetails.moodboards!.length,
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(horizontal: 7),
            width: Get.height * 0.06,
            height: Get.height * 0.06,
            decoration:
                const BoxDecoration(shape: BoxShape.circle, color: Colors.blue),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(
                '$baseUrl/uploads/${designDetailsController.selectDesignDetails.moodboards![index].moodboardImage}',
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: SizedBox(
                      width: Get.width * 0.05,
                      height: Get.width * 0.05,
                      child: CircularProgressIndicator(
                        color: primaryColor,
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
