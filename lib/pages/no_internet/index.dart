import 'package:flutter/material.dart';
import 'package:is_app/res/images.dart';
import 'package:lottie/lottie.dart';
import '../../../res/styles.dart';

class NoInternetPage extends StatelessWidget {
  const NoInternetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Lottie.asset(noInternetIcon),
                  const SizedBox(height: 10),
                  Text(
                    'No internet',
                    style: textStyleForListTitle,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
