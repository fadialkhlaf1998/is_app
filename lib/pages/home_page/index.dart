import 'package:is_app/controller/init_controller.dart';
import 'package:is_app/pages/home_page/widgets/categories_list.dart';
import 'package:is_app/pages/home_page/widgets/loading_home_page/loading_category_list.dart';
import 'package:is_app/pages/home_page/widgets/loading_home_page/loading_home_slider.dart';
import 'package:is_app/pages/home_page/widgets/loading_home_page/loading_styles_grid.dart';
import 'package:is_app/pages/home_page/widgets/slider.dart';
import 'package:is_app/pages/home_page/widgets/styles_grid.dart';
import 'package:is_app/pages/home_page/widgets/title.dart';
import 'package:is_app/res/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);
  final InitController initController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RefreshIndicator(
        color: primaryColor,
        onRefresh: () async {
          await initController.getHomePageDataRequest();
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            child: Column(
              children: [
                const HomeTitle(),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 800),
                  child: initController.loading.value
                      ? const LoadingHomeSlider()
                      : HomeSlider(),
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 1200),
                  child: initController.loading.value
                      ? const LoadingCategoriesList()
                      : CategoriesList(),
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 1400),
                  child: initController.loading.value
                      ? const LoadingStylesGrid()
                      : HomeStylesGrid(),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
