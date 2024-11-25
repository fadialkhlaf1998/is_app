import 'package:is_app/controller/app_storage.dart';
import 'package:is_app/controller/init_controller.dart';
import 'package:is_app/data/models/body/auth/login_body.dart';
import 'package:is_app/data/models/response/auth/user_data.dart';
import 'package:is_app/data/repository/auth_repo.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  AuthRepo authRepo = AuthRepo();
  final InitController initController = Get.find();

  @override
  void onInit() async {
    await checkUserLogin();
    super.onInit();
  }

  checkUserLogin() async {
    UserData user =
        await AppStorage.getUserFromSharedPreferences() ?? UserData(token: '');
    if (user.token != '' || user.token != null) {
      print('Hi from here!!');
      String email = await AppStorage.getUserEmail();
      String password = await AppStorage.getUserPassword();
      await authRepo
          .login(LoginBody(username: email, password: password))
          .then((value) async {
        if (value.code == 1) {
          print('done___________>');
          initController.userData = UserData.fromJson(value.data);
          await AppStorage.saveUserToSharedPreferences(
              UserData.fromJson(value.data));
        } else {
          await AppStorage.deleteUserData();
          initController.userData = UserData(token: '');
        }
      });
    } else {
      await AppStorage.deleteUserData();
      initController.userData = UserData(token: '');
    }
    await Future.delayed(const Duration(milliseconds: 1500)).then((value) {
      Get.offAllNamed('/mainPage');
    });
  }
}
