import 'package:is_app/controller/app_storage.dart';
import 'package:is_app/data/models/body/auth/sign_up_body.dart';
import 'package:is_app/data/repository/auth_repo.dart';
import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/veridication_code/index.dart';
import 'package:is_app/widgets/snack_bar/top_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  RxBool loading = false.obs;
  RxBool hidePassword = true.obs;

  AuthRepo authRepo = AuthRepo();

  signUpRequest(BuildContext context) async {
    if (checkFields(context)) {
      loading.value = true;
      await authRepo
          .signUp(SignUpBody(
              email: emailController.text,
              password: passwordController.text,
              phone: phoneController.text,
              fullName: fullNameController.text))
          .then((value) {
        print(value);
        if (value.code == 1) {
          AppStorage.saveEmailPassword(emailController.text, passwordController.text);
          Get.to(VerificationCodePage());
        } else {
          TopSnackBar.warning(context, context.localizations.something_wrong);
        }
        loading.value = false;
      });
    }
  }

  checkEmail(email) {
    String emailPattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
    RegExp regex = RegExp(emailPattern);
    return email.isNotEmpty && regex.hasMatch(email);
  }

  checkPassword(password) {
    return password.isNotEmpty && password.length >= 8;
  }

  checkFields(BuildContext context) {
    if (fullNameController.text.isNotEmpty) {
      if (checkEmail(emailController.text)) {
        if (checkPassword(passwordController.text)) {
          return true;
          // if (phoneController.text.isNotEmpty) {
          //   return true;
          // }
          // else {
          //   TopSnackBar.warning(context, context.localizations.phone_empty);
          //   return false;
          // }
        } else {
          TopSnackBar.warning(context, context.localizations.valid_password);
          return false;
        }
      } else {
        TopSnackBar.warning(context, context.localizations.valid_email);
        return false;
      }
    } else {
      TopSnackBar.warning(context, context.localizations.full_name_empty);
      return false;
    }
  }
}
