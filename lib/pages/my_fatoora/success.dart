import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SuccessPayment extends StatefulWidget {
  const SuccessPayment({Key? key}) : super(key: key);

  @override
  State<SuccessPayment> createState() => _SuccessPaymentState();
}

class _SuccessPaymentState extends State<SuccessPayment> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 5000)).then((value) {
      // Get.offAllNamed('/mainPage');
      //
      // Future.delayed(Duration(milliseconds: 1000)).then((value) {
      //
      // });
      Get.offNamed('/orderHistory');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 100,
                ),
                Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 100,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Your Order Placed Successfully, Thank You For Using IS App",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: Get.width * 0.8,
                  child: LinearProgressIndicator(),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
