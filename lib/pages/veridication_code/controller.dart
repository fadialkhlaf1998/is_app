import 'package:is_app/controller/app_storage.dart';
import 'package:is_app/data/models/body/auth/sign_up_body.dart';
import 'package:is_app/data/models/body/auth/verification_code_body.dart';
import 'package:is_app/data/repository/auth_repo.dart';
import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/widgets/snack_bar/top_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class VerificationCodeController extends GetxController {
  TextEditingController code = TextEditingController();

  RxBool loading = false.obs;

  AuthRepo authRepo = AuthRepo();

  verificationCodeRequest(BuildContext context) async {
    if (checkFields(context)) {
      loading.value = true;
      String email = await AppStorage.getUserEmail();
      await authRepo
          .verificationCode(VerificationCodeBody(
              email: email,
              code: code.text))
          .then((value) {
        if (value.code == 1) {
          Get.offAllNamed("/");
        } else {
          TopSnackBar.warning(context, context.localizations.something_wrong);
        }
      });
    }
  }


  checkFields(BuildContext context) {
    if (code.text.isNotEmpty) {
      return true;
    } else {
      TopSnackBar.warning(context, context.localizations.email);
      return false;
    }
  }
}
