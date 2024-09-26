import 'package:is_app/pages/my_fatoora/my_fatoora.dart';
import 'package:flutter/material.dart';

class PaymentPage extends StatelessWidget {

  String total;


  PaymentPage(this.total);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyFatoraahPage("Payment", this.total),
    );
  }
}
