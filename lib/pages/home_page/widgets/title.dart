import 'package:is_app/controller/constant.dart';
import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeTitle extends StatelessWidget {
  const HomeTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      padding:
          EdgeInsets.symmetric(vertical: 10, horizontal: Constant.paddingSpace),
      child: RichText(
        text: TextSpan(
          text: context.localizations.lets_start,
          style: textStyleForSmallTitle,
          children: <TextSpan>[
            TextSpan(
              text: context.localizations.exploring,
              style: textStyleForColorTitle,
            ),
          ],
        ),
      ),
    );
  }
}
