import 'package:is_app/controller/constant.dart';
import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/category_details/controller.dart';
import 'package:is_app/pages/category_details/widgets/custom_filter_bottom_sheet.dart';
import 'package:is_app/pages/category_details/widgets/design_card.dart';
import 'package:is_app/pages/home_page/controller.dart';
import 'package:is_app/res/color.dart';
import 'package:is_app/res/styles.dart';
import 'package:is_app/widgets/empty/empty_list.dart';
import 'package:is_app/widgets/loading/custom_loading.dart';
import 'package:is_app/widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryDetailsPage extends StatelessWidget {
  CategoryDetailsPage({Key? key}) : super(key: key);
  final CategoryDetailsController categoryDetailsController = Get.find();
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          title: Text(
              homeController.selectCategoryName.value,
              style: textStyleForTitle),
          leading: GestureDetector(
            onTap: () {
              categoryDetailsController.clearFilter();
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
                              categoryDetailsController.clearSearch();
                            },
                            child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 10),
                                child: categoryDetailsController
                                        .searchTextController.text.isEmpty
                                    ? Icon(Icons.search, size: 25)
                                    : Icon(Icons.clear, size: 25)),
                          ),
                          labelText: context.localizations.search,
                          width: 0.94,
                          height: 0.06,
                          controller:
                              categoryDetailsController.searchTextController,
                          onChange: (query) => categoryDetailsController
                              .filterItemsBySearch(query),
                          suffixIcon: GestureDetector(
                              onTap: () {
                                if (!categoryDetailsController.loading.value) {
                                  categoryDetailsController
                                      .filterOpenMenu.value = true;
                                  Constant.closeKeyBoard();
                                  categoryDetailsController.clearSearch();
                                }
                              },
                              child: Container(
                                  color: Colors.transparent,
                                  child:
                                      const Icon(Icons.filter_alt, size: 25))),
                          textInputType: TextInputType.text),
                      CustomLoading(
                        loading: categoryDetailsController.loading.value,
                        child: categoryDetailsController
                                .categoryDesignsFilterList.isEmpty
                            ? EmptyList()
                            : Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 20),
                                width: Get.width * 0.94,
                                child: GridView.builder(
                                  shrinkWrap: true,
                                  physics: const NeverScrollableScrollPhysics(),
                                  itemCount: categoryDetailsController
                                      .categoryDesignsFilterList.length,
                                  itemBuilder: (BuildContext context, index) {
                                    return DesignCard(index: index);
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
              CustomFilterBottomSheet(),
            ],
          ),
        ),
      );
    });
  }
}

