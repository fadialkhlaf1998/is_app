import 'package:is_app/controller/init_controller.dart';
import 'package:is_app/pages/cart/index.dart';
import 'package:is_app/pages/gallery/index.dart';
import 'package:is_app/pages/home_page/index.dart';
import 'package:is_app/pages/main_page/controller.dart';
import 'package:is_app/pages/profile/controller.dart';
import 'package:is_app/pages/profile/index.dart';
import 'package:is_app/pages/search/index.dart';
import 'package:is_app/widgets/bottom_bar/custom_bottom_bar.dart';
import 'package:is_app/widgets/guest/cart_guest.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainPage extends StatelessWidget {
  MainPage({Key? key}) : super(key: key);
  final ProfileController profileController = Get.find();
  final MainPageController mainPageController = Get.find();
  final InitController initController = Get.find();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        profileController.closeAllMenu();
        return await mainPageController.backButton(context);
        // return false;
      },
      child: Scaffold(
        bottomNavigationBar: CustomBottomBar(isMainPage: true),
        body: SafeArea(
          child: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: mainPageController.pageController,
            children: [
              HomePage(),
              SearchMainPage(),
              GalleryPage(),
              initController.checkUserIfLogin() ? CartPage() : CartGuest(),
              ProfilePage(),
            ],
          ),
        ),
      ),
    );
  }
}
