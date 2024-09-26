import 'package:is_app/pages/cart/controller.dart';
import 'package:is_app/pages/gallery/controller.dart';
import 'package:is_app/pages/home_page/controller.dart';
import 'package:is_app/pages/main_page/controller.dart';
import 'package:is_app/pages/profile/controller.dart';
import 'package:is_app/pages/search/controller.dart';
import 'package:get/get.dart';

class MainPageBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(ProfileController());
    Get.put(MainPageController());
    Get.put(CartController());
    Get.put(HomeController());
    Get.put(GalleryController());
    Get.put(SearchMainPageController());
  }
}
