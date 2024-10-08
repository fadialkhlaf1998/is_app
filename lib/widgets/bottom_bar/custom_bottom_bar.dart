import 'package:is_app/pages/cart/controller.dart';
import 'package:is_app/pages/main_page/controller.dart';
import 'package:is_app/pages/profile/controller.dart';
import 'package:is_app/pages/search/controller.dart';
import 'package:is_app/res/images.dart';
import 'package:is_app/widgets/bottom_bar/bottom_bar_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomBar extends StatelessWidget {
  CustomBottomBar({Key? key}) : super(key: key);
  final ProfileController profileController = Get.find();
  final MainPageController mainPageController = Get.find();
  final CartController cartController = Get.find();
  final SearchMainPageController searchMainPageController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return BottomAppBar(
        shape: const CircularNotchedRectangle(),
        shadowColor: Colors.black,
        notchMargin: 10,
        color: Colors.white,
        elevation: 15,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          curve: Curves.fastOutSlowIn,
          height: Get.height * 0.07,
          child: SingleChildScrollView(
            child: SizedBox(
              height: Get.height * 0.07,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BottomBarIcon(
                      onTap: () {
                        mainPageController.moveBetweenPages(0);

                      },
                      image: HOME,
                      select: mainPageController.pageIndex.value == 0
                          ? true
                          : false),
                  BottomBarIcon(
                      onTap: () async {
                        mainPageController.moveBetweenPages(1);
                        if (mainPageController.pageIndex.value == 1) {
                          await searchMainPageController.clearSearch();
                        }
                      },
                      image: SEARCH,
                      select: mainPageController.pageIndex.value == 1
                          ? true
                          : false),
                  BottomBarIcon(
                      onTap: () {
                        mainPageController.moveBetweenPages(2);
                      },
                      image: GALLERY,
                      select: mainPageController.pageIndex.value == 2
                          ? true
                          : false),
                  BottomBarIcon(
                      onTap: () async {
                        mainPageController.moveBetweenPages(3);
                        if (mainPageController.pageIndex.value == 3) {
                          await cartController.getCartRequest();
                        }
                      },
                      image: CART,
                      select: mainPageController.pageIndex.value == 3
                          ? true
                          : false),
                  BottomBarIcon(
                      onTap: () {
                        mainPageController.moveBetweenPages(4);
                        profileController.closeAllMenu();
                      },
                      image: PROFILE,
                      select: mainPageController.pageIndex.value == 4
                          ? true
                          : false),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
