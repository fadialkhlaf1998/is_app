import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HaveAccountOption extends StatelessWidget {
  const HaveAccountOption({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: Get.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            context.localizations.have_account,
            style: textStyleForSmallBlackText,
          ),
          GestureDetector(
            onTap: () {
              Get.offNamed('/login');
            },
            child: Container(
              padding: const EdgeInsets.all(7),
              color: Colors.transparent,
              child: Text(context.localizations.login,
                  style: textStyleForNormalColorText),
            ),
          )
        ],
      ),
    );
  }
}
