import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FailPayment extends StatefulWidget {
  const FailPayment({Key? key}) : super(key: key);

  @override
  State<FailPayment> createState() => _FailPaymentState();
}

class _FailPaymentState extends State<FailPayment> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(milliseconds: 5000)).then((value) {
      Get.offAllNamed('/mainPage');
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
                  Icons.error,
                  color: Colors.red,
                  size: 100,
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Oops Something Went Wrong, Please Try Again",
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
