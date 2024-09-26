import 'package:is_app/extensions/context_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EmptyList extends StatelessWidget {
  final String? title;
  EmptyList({this.title, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * 0.3,
      width: Get.width * 0.8,
      child: Center(
        child: Text(title ?? context.localizations.list_empty,
            textAlign: TextAlign.center),
      ),
    );
  }
}
