import 'dart:ui';

import 'package:is_app/controller/app_storage.dart';
import 'package:is_app/data/models/response/guest/home_page_response.dart';
import 'package:is_app/data/models/response/auth/user_data.dart';
import 'package:is_app/data/repository/guest_repo.dart';
import 'package:get/get.dart';

class InitController extends GetxController {
  GuestRepo guestRepo = GuestRepo();

  RxList<Banners> bannersList = <Banners>[].obs;
  RxList<Categories> categoriesList = <Categories>[].obs;
  RxList<Styles> stylesList = <Styles>[].obs;
  RxList<Moodboards> moodboardsList = <Moodboards>[].obs;

  RxBool showBadge = false.obs;

  RxBool loading = false.obs;

  UserData userData = UserData(token: '');

  changeLanguage(code) {
    Locale locale = Locale(code);
    Get.updateLocale(locale);
  }

  getHomePageDataRequest() async {
    loading.value = true;
    bannersList.clear();
    categoriesList.clear();
    stylesList.clear();
    moodboardsList.clear();

    await guestRepo.getHomePageData().then((value) async {
      if (value.code == 1) {
        bannersList.addAll((value.data['banners'] as List)
            .map((e) => Banners.fromJson(e))
            .toList());
        categoriesList.addAll((value.data['categories'] as List)
            .map((e) => Categories.fromJson(e))
            .toList());
        stylesList.addAll((value.data['styles'] as List)
            .map((e) => Styles.fromJson(e))
            .toList());
        moodboardsList.addAll((value.data['moodboards'] as List)
            .map((e) => Moodboards.fromJson(e))
            .toList());
        loading.value = false;
      } else {
        loading.value = false;
      }
    });
  }

  checkUserIfLogin() {
    print(userData.token);
    if (userData.token == '' || userData.token == null) {
      return false;
    } else {
      return true;
    }
  }

  checkLanguage() async {
    String lang = await AppStorage.getLanguage();
    changeLanguage(lang);
  }

  checkBadge() async {
    showBadge.value = await AppStorage.getBadgeStatus();
  }

  @override
  void onInit() async {
    super.onInit();
    await checkBadge();
    await checkLanguage();
    userData =
        await AppStorage.getUserFromSharedPreferences() ?? UserData(token: '');
    getHomePageDataRequest();
  }
}
