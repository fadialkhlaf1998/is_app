import 'package:is_app/controller/constant.dart';
import 'package:is_app/controller/init_controller.dart';
import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/profile/controller.dart';
import 'package:is_app/pages/profile/widgets/delete_account_bottom_sheet.dart';
import 'package:is_app/pages/profile/widgets/language_bottom_sheet.dart';
import 'package:is_app/pages/profile/widgets/logout_bottom_sheet.dart';
import 'package:is_app/pages/profile/widgets/profile_header.dart';
import 'package:is_app/pages/profile/widgets/profile_option.dart';
import 'package:is_app/widgets/guest/login_now_action.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends StatelessWidget {
  ProfilePage({Key? key}) : super(key: key);
  final ProfileController profileController = Get.find();
  final InitController initController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ProfileHeader(),
              initController.checkUserIfLogin()
                  ? ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: 7,
                      itemBuilder: (BuildContext context, index) {
                        return ProfileOption(
                          icon: profileController.profileOptionIcons[index],
                          title: Constant.isEnglish()
                              ? profileController.profileOptionTitles[index]
                              : profileController
                                  .profileOptionArabicTitles[index],
                          index: index,
                        );
                      },
                    )
                  : ProfileOption(
                      icon: profileController.profileOptionIcons[3],
                      title: profileController.profileOptionTitles[3],
                      index: 3,
                    ),
              initController.checkUserIfLogin()
                  ? const SizedBox()
                  : LoginNowAction(text: context.localizations.login_now)
            ],
          ),
        ),
        LogoutBottomSheet(),
        DeleteAccountBottomSheet(),
        LanguageBottomSheet(),
      ],
    );
  }
}
