import 'package:is_app/controller/constant.dart';
import 'package:is_app/controller/init_controller.dart';
import 'package:is_app/data/constants/api_constants.dart';
import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/category_details/controller.dart';
import 'package:is_app/res/color.dart';
import 'package:is_app/res/styles.dart';
import 'package:is_app/widgets/button/custom_button.dart';
import 'package:is_app/widgets/custom_svg_pic/custom_svg_network.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomFilterBottomSheet extends StatelessWidget {
  CustomFilterBottomSheet({Key? key}) : super(key: key);
  final CategoryDetailsController categoryDetailsController = Get.find();
  final InitController initController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        alignment: Alignment.bottomCenter,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: categoryDetailsController.filterOpenMenu.value
                ? GestureDetector(
                    onTap: () {
                      categoryDetailsController.filterOpenMenu.value = false;
                    },
                    child: Container(
                      key: const ValueKey('1'),
                      color: black.withOpacity(0.5),
                      width: Get.width,
                      height: Get.height,
                    ),
                  )
                : SizedBox(
                    key: const ValueKey('2'),
                    width: Get.width,
                    height: Get.height),
          ),
          AnimatedPositioned(
            bottom: categoryDetailsController.filterOpenMenu.value
                ? 0
                : -Get.height * 0.6,
            duration: const Duration(milliseconds: 700),
            curve: Curves.fastOutSlowIn,
            child: GestureDetector(
              // on
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                    color: white),
                width: Get.width,
                padding: EdgeInsets.only(
                    bottom: Get.height * 0.03, top: Get.height * 0.01),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(bottom: 20),
                            width: Get.width * 0.25,
                            height: 4,
                            decoration: BoxDecoration(
                                color: black.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(100)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                right: 10, left: 10, bottom: 10),
                            child: Row(
                              children: [
                                Icon(Icons.filter_alt, color: grey, size: 20),
                                const SizedBox(width: 5),
                                Text(context.localizations.filter_by),
                              ],
                            ),
                          ),
                          _categoriesList(context),
                          const SizedBox(height: 10),
                          _stylesList(context),
                          const SizedBox(height: 0),
                          _moodboardList(context),
                          const SizedBox(height: 20),
                          CustomButton(
                              width: 0.7,
                              height: 0.05,
                              color: primaryColor,
                              title: context.localizations.apply_filters,
                              onTap: () {
                                categoryDetailsController
                                    .applyFilterRequest(context);
                              },
                              textStyle: textStyleForButton),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    });
  }

  _categoriesList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding:
              const EdgeInsets.only(left: 15, right: 15, bottom: 10, top: 5),
          child: Text(context.localizations.categories),
        ),
        SizedBox(
          width: Get.width,
          height: Get.height * 0.04,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: initController.categoriesList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, index) {
              return Obx(() {
                return GestureDetector(
                  onTap: () {
                    categoryDetailsController.addOrRemoveFilterCategory(index);
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 200),
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        color:
                            categoryDetailsController.checkCategorySelect(index)
                                ? primaryColor
                                : Colors.transparent,
                        border: Border.all(color: lightBlack.withOpacity(0.5)),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      children: [
                        const SizedBox(width: 8),
                        CustomSvgNetwork(
                            width: 20,
                            height: 20,
                            color: categoryDetailsController
                                    .checkCategorySelect(index)
                                ? white
                                : lightBlack,
                            image:
                                '$baseUrl/uploads/${initController.categoriesList[index].image}'),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            Constant.isEnglish()
                                ? initController.categoriesList[index].title
                                    .toString()
                                : initController.categoriesList[index].arTitle
                                    .toString(),
                            style: categoryDetailsController
                                    .checkCategorySelect(index)
                                ? textStyleForSmallWhiteText
                                : textStyleForSmallBlackText,
                            textAlign: TextAlign.center,
                            maxLines: 1,
                          ),
                        )
                      ],
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

  _stylesList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.only(right: 15, left: 15, top: 5),
          child: Text(context.localizations.styles),
        ),
        SizedBox(
          width: Get.width,
          height: Get.height * 0.13,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: initController.stylesList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, index) {
              return Obx(() {
                return GestureDetector(
                  onTap: () {
                    categoryDetailsController.addOrRemoveFilterStyle(index);
                  },
                  child: Container(
                    color: Colors.transparent,
                    width: Get.height * 0.11,
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AnimatedContainer(
                          duration: Duration(milliseconds: 300),
                          width: Get.height * 0.08,
                          height: Get.height * 0.08,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: primaryColor,
                                  width: categoryDetailsController
                                          .checkStyleSelect(index)
                                      ? 2.5
                                      : 0)),
                          child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  '$baseUrl/uploads/${initController.stylesList[index].image}')),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          Constant.isEnglish()
                              ? initController.stylesList[index].title
                                  .toString()
                              : initController.stylesList[index].arTitle
                                  .toString(),
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style:
                              categoryDetailsController.checkStyleSelect(index)
                                  ? textStyleForSmallColorText
                                  : textStyleForSmallBlackText,
                          maxLines: 1,
                        ),
                      ],
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

  _moodboardList(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding:
              const EdgeInsets.only(right: 15, left: 15, top: 7, bottom: 7),
          child: Text(context.localizations.moodboards),
        ),
        SizedBox(
          width: Get.width,
          height: Get.height * 0.06,
          child: ListView.builder(
            physics: const BouncingScrollPhysics(),
            itemCount: initController.moodboardsList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (BuildContext context, index) {
              return Obx(() {
                return GestureDetector(
                  onTap: () {
                    categoryDetailsController.addOrRemoveFilterMoodboard(index);
                  },
                  child: AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    height: Get.height * 0.06,
                    width: Get.height * 0.06,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                            color: primaryColor,
                            width: categoryDetailsController
                                    .checkMoodboardSelect(index)
                                ? 3
                                : 0)),
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(
                          '$baseUrl/uploads/${initController.moodboardsList[index].image}'),
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
