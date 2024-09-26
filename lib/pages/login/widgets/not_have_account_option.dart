import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NotHaveAccountOption extends StatelessWidget {
  const NotHaveAccountOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            context.localizations.not_have_account,
            style: textStyleForSmallBlackText,
          ),
          GestureDetector(
            onTap: () {
              Get.offNamed('/signUp');
            },
            child: Container(
              padding: const EdgeInsets.all(7),
              color: Colors.transparent,
              child: Text(context.localizations.sign_up,
                  style: textStyleForNormalColorText),
            ),
          )
        ],
      ),
    );
  }
}
