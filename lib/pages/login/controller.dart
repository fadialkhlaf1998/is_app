import 'package:is_app/controller/app_storage.dart';
import 'package:is_app/controller/constant.dart';
import 'package:is_app/controller/init_controller.dart';
import 'package:is_app/data/models/body/auth/forgot_password_body.dart';
import 'package:is_app/data/models/body/auth/login_body.dart';
import 'package:is_app/data/models/response/auth/user_data.dart';
import 'package:is_app/data/repository/auth_repo.dart';
import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/veridication_code/index.dart';
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
            if(initController.userData.is_active == 0){
              Get.offAll(VerificationCodePage());
            }else{
              TopSnackBar.success(
                  context, context.localizations.login_successfully);

              Get.offAllNamed('/mainPage');
            }
          } else {
            TopSnackBar.warning(context, value.data['message']);
          }
          loading.value = false;
        });
      } else {
        TopSnackBar.warning(
            context, context.localizations.valid_password_login);
      }
    } else {
      TopSnackBar.warning(context, context.localizations.valid_email);
    }
  }
  forgotPasswordRequest(BuildContext context) async {
    Constant.closeKeyBoard();
    if (checkEmail(emailController.text)) {
      loading.value = true;
      await authRepo
          .forgotPassword(ForgotPasswordBody(
        email: emailController.text
      ))
          .then((value) async {
        if (value.code == 1) {
          TopSnackBar.success(context, context.localizations.we_sent_an_email_please_check_your_email);
        } else {
          TopSnackBar.warning(context, value.data['message']);
        }
        loading.value = false;
      });
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
