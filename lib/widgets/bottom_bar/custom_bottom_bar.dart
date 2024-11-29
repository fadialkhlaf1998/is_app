import 'package:is_app/controller/init_controller.dart';
import 'package:is_app/pages/cart/controller.dart';
import 'package:is_app/pages/main_page/controller.dart';
import 'package:is_app/pages/profile/controller.dart';
import 'package:is_app/pages/search/controller.dart';
import 'package:is_app/res/images.dart';
import 'package:is_app/widgets/bottom_bar/bottom_bar_icon.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomBottomBar extends StatelessWidget {
  final bool isMainPage;
  CustomBottomBar({Key? key, required this.isMainPage}) : super(key: key);
  final ProfileController profileController = Get.find();
  final MainPageController mainPageController = Get.find();
  final CartController cartController = Get.find();
  final SearchMainPageController searchMainPageController = Get.find();
  final InitController initController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return BottomAppBar(
        // height: Get.height * 0.08,
        shape: const CircularNotchedRectangle(),
        shadowColor: Colors.black,
        notchMargin: 10,
        color: Colors.white,
        elevation: 15,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 350),
          curve: Curves.fastOutSlowIn,
          height: Get.height * 0.08,
          // color: Colors.red,
          child: SingleChildScrollView(
            child: SizedBox(
              height: Get.height * 0.08,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      child: BottomBarIcon(
                          onTap: () {
                            mainPageController.moveBetweenPages(0, isMainPage);
                          },
                          image: HOME,
                          select: mainPageController.pageIndex.value == 0
                              ? true
                              : false),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: BottomBarIcon(
                          onTap: () async {
                            mainPageController.moveBetweenPages(1, isMainPage);
                            if (mainPageController.pageIndex.value == 1) {
                              await searchMainPageController.clearSearch();
                            }
                          },
                          image: SEARCH,
                          select: mainPageController.pageIndex.value == 1
                              ? true
                              : false),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: BottomBarIcon(
                          onTap: () {
                            mainPageController.moveBetweenPages(2, isMainPage);
                          },
                          image: GALLERY,
                          select: mainPageController.pageIndex.value == 2
                              ? true
                              : false),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: BottomBarIcon(
                        onTap: () async {
                          mainPageController.moveBetweenPages(3, isMainPage);
                          await cartController.getCartRequest();
                        },
                        image: CART,
                        select: mainPageController.pageIndex.value == 3
                            ? true
                            : false,
                        badge: initController.showBadge.value,
                      ),
                    ),
                  ),
                  Expanded(
                      child: Container(
                    child: BottomBarIcon(
                        onTap: () {
                          mainPageController.moveBetweenPages(4, isMainPage);
                          profileController.closeAllMenu();
                        },
                        image: PROFILE,
                        select: mainPageController.pageIndex.value == 4
                            ? true
                            : false),
                  ))
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
