import 'package:is_app/controller/constant.dart';
import 'package:is_app/data/constants/api_constants.dart';
import 'package:is_app/pages/category_details/controller.dart';
import 'package:is_app/pages/home_page/controller.dart';
import 'package:is_app/res/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DesignCard extends StatelessWidget {
  final int index;
  DesignCard({required this.index, Key? key}) : super(key: key);
  final CategoryDetailsController categoryDetailsController = Get.find();
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        homeController.selectDesignId.value = categoryDetailsController
                .categoryDesignsFilterList[index].designId ??
            0;
        Get.toNamed('/designDetails');
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Get.width * 0.47,
              height: Get.width * 0.47,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Constant.border),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  '$baseUrl/uploads/${categoryDetailsController.categoryDesignsFilterList[index].images!.split(',')[0]}',
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
            Expanded(
              child: Container(
                width: Get.width * 0.45,
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        Constant.isEnglish() ? categoryDetailsController
                            .categoryDesignsFilterList[index].title.toString() : categoryDetailsController
                            .categoryDesignsFilterList[index].arTitle.toString(),overflow: TextOverflow.ellipsis,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(Constant.numberFormat(categoryDetailsController
                            .categoryDesignsFilterList[index].price
                            .toString())),
                      ],
                    ),
                    SizedBox(
                      height: Get.height * 0.04,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: categoryDetailsController
                            .categoryDesignsList[index].moodboards!.length,
                        itemBuilder: (BuildContext context, index1) {
                          return Container(
                            height: Get.height * 0.04,
                            width: Get.height * 0.04,
                            margin: const EdgeInsets.only(right: 10),
                            decoration: const BoxDecoration(
                                color: Colors.grey, shape: BoxShape.circle),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.network(
                                '$baseUrl/uploads/${categoryDetailsController.categoryDesignsList[index].moodboards![index1].moodboardImage}',
                                fit: BoxFit.cover,
                                loadingBuilder: (BuildContext context,
                                    Widget child,
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
                                        value: loadingProgress
                                                    .expectedTotalBytes !=
                                                null
                                            ? loadingProgress
                                                    .cumulativeBytesLoaded /
                                                loadingProgress
                                                    .expectedTotalBytes!
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
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
