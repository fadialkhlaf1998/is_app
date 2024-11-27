import 'package:is_app/controller/constant.dart';
import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/home_page/controller.dart';
import 'package:is_app/pages/styles_details/controller.dart';
import 'package:is_app/pages/styles_details/widgets/custom_filter_bottom_sheet_styles.dart';
import 'package:is_app/pages/styles_details/widgets/styles_design_card.dart';
import 'package:is_app/res/color.dart';
import 'package:is_app/res/styles.dart';
import 'package:is_app/widgets/bottom_bar/custom_bottom_bar.dart';
import 'package:is_app/widgets/empty/empty_list.dart';
import 'package:is_app/widgets/loading/custom_loading.dart';
import 'package:is_app/widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StylesDetailsPage extends StatelessWidget {
  StylesDetailsPage({Key? key}) : super(key: key);
  final StylesDetailsController stylesDetailsController = Get.find();
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        bottomNavigationBar: CustomBottomBar(isMainPage: false),
        backgroundColor: white,
        appBar: AppBar(
          title: Text(homeController.selectStylesName.value,
              style: textStyleForTitle),
          leading: GestureDetector(
            onTap: () {
              stylesDetailsController.clearFilter();
            },
            child: Container(
                color: Colors.transparent,
                child: Icon(Icons.arrow_back_ios_new_outlined,
                    color: black, size: 18)),
          ),
          elevation: 0,
          backgroundColor: white,
        ),
        body: SafeArea(
          child: Stack(
            children: [
              SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: SizedBox(
                  width: Get.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 10),
                      CustomTextField(
                          icon: GestureDetector(
                            onTap: () {
                              stylesDetailsController.clearSearch();
                            },
                            child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: stylesDetailsController
                                        .searchTextController.text.isEmpty
                                    ? Icon(Icons.search, size: 25)
                                    : Icon(Icons.clear, size: 25)),
                          ),
                          labelText: context.localizations.search,
                          width: 0.94,
                          height: 0.05,
                          controller:
                              stylesDetailsController.searchTextController,
                          onChange: (query) => stylesDetailsController
                              .filterItemsBySearch(query),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                if (!stylesDetailsController.loading.value) {
                                  stylesDetailsController.filterOpenMenu.value =
                                      true;
                                  Constant.closeKeyBoard();
                                  stylesDetailsController.clearSearch();
                                }
                              },
                              child: Container(
                                  color: Colors.transparent,
                                  child: Icon(Icons.filter_alt,
                                      size: 25, color: primaryColor))),
                          textInputType: TextInputType.text),
                      CustomLoading(
                        loading: stylesDetailsController.loading.value,
                        child: stylesDetailsController.stylesDesignsList.isEmpty
                            ? EmptyList()
                            : Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                width: Get.width * 0.94,
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: stylesDetailsController
                                      .stylesDesignsFilterList.length,
                                  itemBuilder: (BuildContext context, index) {
                                    return StylesDesignCard(index: index);
                                  },
                                  gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                    childAspectRatio: 2 / 3,
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 10,
                                    mainAxisSpacing: 25,
                                  ),
                                ),
                              ),
                      )
                    ],
                  ),
                ),
              ),
              CustomFilterBottomSheetStyles(),
            ],
          ),
        ),
      );
    });
  }
}
