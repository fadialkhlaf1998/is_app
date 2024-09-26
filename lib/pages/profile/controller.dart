import 'package:is_app/controller/app_storage.dart';
import 'package:is_app/controller/init_controller.dart';
import 'package:is_app/data/models/response/auth/user_data.dart';
import 'package:is_app/data/repository/profile_repo.dart';
import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/res/images.dart';
import 'package:is_app/widgets/snack_bar/top_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  final InitController initController = Get.find();

  RxBool logoutOpenMenu = false.obs;
  RxBool deleteAccountOpenMenu = false.obs;
  RxBool languageOpenMenu = false.obs;

  RxBool englishStatus = false.obs;
  RxBool arabicStatus = false.obs;

  ProfileRepo profileRepo = ProfileRepo();

  List<String> profileOptionTitles = [
    'Personal info details',
    'Change password',
    'Order history',
    'Language',
    'Delete account',
    'Logout'
  ];

  List<String> profileOptionArabicTitles = [
    'المعلومات الشخصية',
    'تغيير كلمة المرور',
    'سجل الطلبات',
    'اللغة',
    'حذف الحساب',
    'تسجيل الخروج'
  ];

  List<String> profileOptionIcons = [
    SETTINGS,
    LOCK,
    HISTORY,
    LANGUAGE,
    DELETE,
    LOGOUT
  ];

  profileOptionOnTap(index) {
    switch (index) {
      case 0:
        Get.toNamed('/personalInfoDetails');
        break;
      case 1:
        Get.toNamed('/changePassword');
        break;
      case 2:
        Get.toNamed('/orderHistory');
        break;
      case 3:
        languageOpenMenu.value = true;
        break;
      case 4:
        deleteAccountOpenMenu.value = true;
        break;
      case 5:
        logoutOpenMenu.value = true;
        break;
    }
  }

  chooseLanguage(lang) async {
    if (lang == 'en') {
      englishStatus.value = true;
      arabicStatus.value = false;
      initController.changeLanguage(lang);
      await AppStorage.saveLanguage(lang);
    } else {
      englishStatus.value = false;
      arabicStatus.value = true;
      initController.changeLanguage(lang);
      await AppStorage.saveLanguage(lang);
    }
  }

  logout() {
    initController.userData = UserData(token: '');
    AppStorage.deleteUserData();
    Get.offAllNamed('/mainPage');
  }

  @override
  void onInit() async {
    String lang = await AppStorage.getLanguage();
    if (lang == 'en') {
      englishStatus.value = true;
      arabicStatus.value = false;
    } else {
      englishStatus.value = false;
      arabicStatus.value = true;
    }
    super.onInit();
  }

  deleteAccountRequest(BuildContext context) async {
    profileRepo.deleteAccount().then((value) {
      if (value.code == 1) {
        TopSnackBar.success(
            context, context.localizations.delete_account_success);
        AppStorage.deleteUserData();
        initController.userData = UserData(token: '');
        Get.offAllNamed('/mainPage');
      } else {
        TopSnackBar.warning(context, context.localizations.something_wrong);
      }
    });
  }

  closeAllMenu(){
    languageOpenMenu.value = false;
    deleteAccountOpenMenu.value = false;
    logoutOpenMenu.value = false;
  }


}
