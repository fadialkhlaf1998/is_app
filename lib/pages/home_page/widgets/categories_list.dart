import 'package:is_app/controller/constant.dart';
import 'package:is_app/controller/init_controller.dart';
import 'package:is_app/data/constants/api_constants.dart';
import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/home_page/controller.dart';
import 'package:is_app/res/color.dart';
import 'package:is_app/res/styles.dart';
import 'package:is_app/widgets/custom_svg_pic/custom_svg_network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoriesList extends StatelessWidget {
  CategoriesList({Key? key}) : super(key: key);
  final InitController initController = Get.find();
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: const ValueKey('321'),
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              context.localizations.categories,
              style: textStyleForTitle,
            ),
          ),
          const SizedBox(height: 10),
          Container(
            height: Get.height * 0.13,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: initController.categoriesList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, index) {
                return Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        homeController.selectCategoryId.value =
                            initController.categoriesList[index].categoryId ??
                                0;
                        if (Constant.isEnglish()) {
                          homeController.selectCategoryName.value =
                              initController.categoriesList[index].title ?? '';
                        } else {
                          homeController.selectCategoryName.value =
                              initController.categoriesList[index].arTitle ??
                                  '';
                        }
                        Get.toNamed('/categoryDetails');
                      },
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        width: Get.width * 0.19,
                        height: Get.height * 0.07,
                        decoration: BoxDecoration(
                          color: white2,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: CustomSvgNetwork(
                            height: 30,
                            width: 30,
                            color: lightBlack,
                            image:
                                '$baseUrl/uploads/${initController.categoriesList[index].image}',
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    SizedBox(
                      width: Get.width * 0.22,
                      child: Text(
                        Constant.isEnglish()
                            ? initController.categoriesList[index].title
                                .toString()
                            : initController.categoriesList[index].arTitle
                                .toString(),
                        style: TextStyle(fontSize: 13),
                        textAlign: TextAlign.center,
                        maxLines: 2,
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
