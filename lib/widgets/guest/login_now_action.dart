import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/veridication_code/index.dart';
import 'package:is_app/res/styles.dart';
import 'package:is_app/widgets/button/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginNowAction extends StatelessWidget {
  final String text;
  final Widget? icon;
  const LoginNowAction({required this.text, this.icon, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 50),
      child: Column(
        children: [
          icon ?? const SizedBox(),
          SizedBox(height: icon == null ? 0 : 20),
          RichText(
            text: TextSpan(
                text: text,
                style: textStyleForSmallBlackText,
                children: [
                  TextSpan(
                      text: ' ${context.localizations.inspiral}',
                      style: textStyleForNormalColorText)
                ]),
            textAlign: TextAlign.center,
          ),
          CustomButton(
              width: 0.5,
              height: 0.06,
              color: Colors.transparent,
              title: context.localizations.login,
              onTap: () {
                Get.toNamed('/login');
              },
              textStyle: textStyleForWhiteButton),
        ],
      ),
    );
  }
}
