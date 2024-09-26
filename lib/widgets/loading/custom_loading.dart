import 'package:is_app/res/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomLoading extends StatelessWidget {
  final Widget child;
  final bool loading;
  const CustomLoading({required this.child, required this.loading, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 700),
      child: loading
          ? SizedBox(
              width: Get.width * 0.2,
              height: Get.height * 0.2,
              child: Center(
                child: CircularProgressIndicator(
                  color: primaryColor,
                  strokeWidth: 5,
                ),
              ),
            )
          : child,
    );
  }
}
