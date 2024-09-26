import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/search/controller.dart';
import 'package:is_app/pages/search/widgets/searchResultCard.dart';
import 'package:is_app/res/color.dart';
import 'package:is_app/res/styles.dart';
import 'package:is_app/widgets/button/custom_button.dart';
import 'package:is_app/widgets/empty/empty_list.dart';
import 'package:is_app/widgets/loading/custom_loading.dart';
import 'package:is_app/widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchMainPage extends StatelessWidget {
  SearchMainPage({Key? key}) : super(key: key);
  final SearchMainPageController searchMainPageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                width: Get.width * 0.95,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  context.localizations.search,
                  style: textStyleForTitle,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomTextField(
                      icon: GestureDetector(
                        onTap: () {
                          searchMainPageController.clearSearch();
                        },
                        child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: searchMainPageController
                                    .searchTextController.text.isEmpty
                                ? Icon(Icons.search, size: 25)
                                : Icon(Icons.clear, size: 25)),
                      ),
                      labelText: context.localizations.search,
                      width: 0.7,
                      height: 0.055,
                      controller: searchMainPageController.searchTextController,
                      textInputType: TextInputType.text),
                  CustomButton(
                      width: 0.25,
                      height: 0.055,
                      color: primaryColor,
                      title: context.localizations.search,
                      loading: searchMainPageController.loading.value,
                      onTap: () {
                        searchMainPageController.searchRequest(context);
                      },
                      textStyle: textStyleForSmallWhiteText)
                ],
              ),
              CustomLoading(
                loading: searchMainPageController.loading.value,
                child: searchMainPageController.searchResultList.isEmpty
                    ? EmptyList(title: context.localizations.start_search)
                    : Container(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        width: Get.width * 0.94,
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount:
                              searchMainPageController.searchResultList.length,
                          itemBuilder: (BuildContext context, index) {
                            return SearchResultCard(index: index);
                          },
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            childAspectRatio: 1 / 1,
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                          ),
                        ),
                      ),
              )
            ],
          ),
        ),
      );
    });
  }
}
