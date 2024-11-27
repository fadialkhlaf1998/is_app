import 'package:is_app/data/constants/api_constants.dart';
import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/design_details/controller.dart';
import 'package:is_app/res/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoodboardsList extends StatelessWidget {
  MoodboardsList({Key? key}) : super(key: key);
  final DesignDetailsController designDetailsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(bottom: 5, top: 15, right: 10,left: 10),
          child: Text(context.localizations.chose_color),
        ),
        Container(
          margin: const EdgeInsets.only(bottom: 20),
          width: Get.width,
          height: Get.height * 0.06,
          child: ListView.builder(
            itemCount:
                designDetailsController.selectDesignDetails.moodboards!.length,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, index) {
              return Obx(() {
                return GestureDetector(
                  onTap: () {
                    designDetailsController.choseMoodboard(index, context);
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    margin: const EdgeInsets.symmetric(horizontal: 7),
                    width: Get.height * 0.06,
                    height: Get.height * 0.06,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[300],
                        border: Border.all(
                            color: primaryColor,
                            width: designDetailsController
                                        .chosenMoodboardDesignId.value ==
                                    designDetailsController.selectDesignDetails
                                        .moodboards![index].moodboardDesignId
                                ? 3
                                : 0)),
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
                  ),
                );
              });
            },
          ),
        ),
      ],
    );
  }
}
