import 'package:is_app/controller/app_storage.dart';
import 'package:is_app/controller/constant.dart';
import 'package:is_app/controller/init_controller.dart';
import 'package:is_app/data/models/body/auth/login_body.dart';
import 'package:is_app/data/models/response/auth/user_data.dart';
import 'package:is_app/data/repository/auth_repo.dart';
import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/widgets/snack_bar/top_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  final InitController initController = Get.find();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  AuthRepo authRepo = AuthRepo();

  RxBool loading = false.obs;
  RxBool hidePassword = true.obs;

  loginRequest(BuildContext context) async {
    Constant.closeKeyBoard();
    if (checkEmail(emailController.text)) {
      if (checkPassword(passwordController.text)) {
        loading.value = true;
        await authRepo
            .login(LoginBody(
                username: emailController.text,
                password: passwordController.text))
            .then((value) async {
          if (value.code == 1) {
            initController.userData = UserData.fromJson(value.data);
            await AppStorage.saveUserToSharedPreferences(
                UserData.fromJson(value.data));
            await AppStorage.saveEmailPassword(
                emailController.text, passwordController.text);
            TopSnackBar.success(
                context, context.localizations.login_successfully);
            loading.value = false;
            Get.offAllNamed('/mainPage');
          } else {
            loading.value = false;
            TopSnackBar.warning(context, value.data['message']);
          }
        });
      } else {
        TopSnackBar.warning(
            context, context.localizations.valid_password_login);
      }
    } else {
      TopSnackBar.warning(context, context.localizations.valid_email);
    }
  }

  checkEmail(email) {
    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(emailPattern);
    return email.isNotEmpty && regex.hasMatch(email);
  }

  checkPassword(password) {
    return password.isNotEmpty;
  }
}
