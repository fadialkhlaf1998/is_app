import 'package:is_app/controller/constant.dart';
import 'package:is_app/data/models/body/profile/change_password_body.dart';
import 'package:is_app/data/repository/profile_repo.dart';
import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/widgets/snack_bar/top_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmNewPassword = TextEditingController();

  RxBool hideOld = true.obs;
  RxBool hideNew = true.obs;
  RxBool hideConfirm = true.obs;
  RxBool loading = false.obs;

  ProfileRepo profileRepo = ProfileRepo();

  changePasswordRequest(BuildContext context) async {
    if (!loading.value) {
      if (checkPasswords(context)) {
        Constant.closeKeyBoard();
        loading.value = true;
        await profileRepo
            .changePassword(ChangePasswordBody(
                old: oldPassword.text,
                newPass: newPassword.text,
                confirm: confirmNewPassword.text))
            .then((value) {
          if (value.code == 1) {
            Get.back();
            TopSnackBar.success(
                context, context.localizations.change_password_success);
            loading.value = false;
          } else {
            TopSnackBar.warning(context, value.data);
            loading.value = false;
          }
        });
      }
    }
  }

  checkPasswords(BuildContext context) {
    if (oldPassword.text.isEmpty ||
        newPassword.text.isEmpty ||
        confirmNewPassword.text.isEmpty) {
      TopSnackBar.warning(context, context.localizations.text_fields_empty);
      return false;
    } else if (newPassword.text != confirmNewPassword.text) {
      TopSnackBar.warning(context, context.localizations.confirm_pass_correct);
      return false;
    } else {
      return true;
    }
  }
}
