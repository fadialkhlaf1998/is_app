import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:is_app/controller/constant.dart';
import 'package:is_app/controller/init_controller.dart';
import 'package:is_app/data/constants/api_constants.dart';
import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/cart/controller.dart';
import 'package:is_app/pages/my_fatoora/index.dart';
import 'package:is_app/pages/my_fatoora/success.dart';
import 'package:is_app/widgets/loading/custom_loading.dart';
import 'package:is_app/widgets/snack_bar/top_snack_bar.dart';
import 'package:tabby_flutter_inapp_sdk/tabby_flutter_inapp_sdk.dart';

class PaymentOptionsPage extends StatefulWidget {

  String total;

  PaymentOptionsPage(this.total);

  @override
  State<PaymentOptionsPage> createState() => _PaymentOptionsPageState();
}

class _PaymentOptionsPageState extends State<PaymentOptionsPage> {


  RxBool loading = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // toolbarHeight: 1,
        title: const Text('Payment'),
      ),
      body: Obx(() => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Flex(
            direction: Axis.vertical,
            children: [

              Expanded(
                child: SingleChildScrollView(
                  child: loading.value
                      ?Container(
                    width: Get.width,
                    height: 250,
                    child: Center(
                      child: CustomLoading(child: Center(), loading: true),
                    ),
                  )
                      :Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [

                        GestureDetector(
                          onTap: (){
                            Get.to(PaymentPage(this.widget.total));
                          },
                          child: Container(
                            width: Get.width,
                            height: 50,

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(color: Colors.black.withOpacity(0.2),spreadRadius: 2,blurRadius: 2)
                                ]
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 10,),
                                Container(
                                  width: 40,
                                  height: 40,
                                  child: Icon(Icons.payment),
                                ),
                                SizedBox(width: 10,),
                                Text(context.localizations.full_payment,style: TextStyle(fontWeight: FontWeight.bold,),)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        GestureDetector(
                          onTap: (){
                            lunch_order_tabby(context);
                          },
                          child: Container(
                            width: Get.width,
                            height: 50,

                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(color: Colors.black.withOpacity(0.2),spreadRadius: 2,blurRadius: 2)
                                ]
                            ),
                            child: Row(
                              children: [
                                SizedBox(width: 10,),
                                Container(
                                  width: 40,
                                  height: 40,
                                  child: Image.asset("assets/images/tabby-new.png"),
                                ),
                                SizedBox(width: 10,),
                                Text(context.localizations.installment_payment,style: TextStyle(fontWeight: FontWeight.bold,),),

                              ],


                            ),
                          ),
                        ),

                      ]),
                ),
              ),
            ],
          ),
        ),
      ),),
    );
  }

  // otp.success@tabby.ai,
  // phone: +966500000001
  // otp: 8888
  // https://docs.tabby.ai/testing-guidelines/testing-credentials




  lunch_order_tabby(BuildContext context)async{
    CartController cartController = Get.find();
    InitController initController = Get.find();

    loading(true);
    try{
      // var regesterSince = DateTime.parse("formattedString");
      var now = new DateTime.now();
      var dateFormatted = DateFormat("yyyy-MM-ddTHH:mm:ss").format(now);
      // var regesterSinceFormated = DateFormat("yyyy-MM-ddTHH:mm:ss").format(regesterSince);
      String  orderTabbyId = DateTime.now().millisecondsSinceEpoch.toString();

      final mockPayload = Payment(

        amount: this.widget.total,
        currency: Currency.sar,
        buyer: Buyer(
          // email: 'otp.success@tabby.ai',
          // phone: "+966500000001",
          email: initController.userData.email!,
          phone: '',
          name: initController.userData.fullName!,
        ),
        buyerHistory: BuyerHistory(
          loyaltyLevel: 0,
          registeredSince: '2022-08-24T14:15:22Z',
          wishlistCount: 0,
        ),
        shippingAddress: ShippingAddress(
          city: 'Riyadh',
          address: 'Kingdom of Saudi Arabia - Rajiyah - Al Munisiyah Dist',
          zip: '',
        ),
        order: Order(referenceId: orderTabbyId, items:
        cartController.cartList.map((element) => OrderItem(
            title: element.title!,
            description: element.description,
            quantity: 1,
            unitPrice: element.price!.toString(),
            referenceId: element.designId!.toString(),
            productUrl: '',
            category: element.category!.toString(),
        )).toList()
        ),
        orderHistory: [],
      );
      final session = await TabbySDK().createSession(TabbyCheckoutPayload(
        //todo change code
        merchantCode: 'مؤسسة الهام الرسم للتصميمsau',
        lang: Constant.isEnglish()?Lang.en:Lang.ar,
        payment: mockPayload,
      ));
      loading(false);
      print('*************** myurl ***************');
      print(session.availableProducts.installments!.webUrl);
      TabbyWebView.showWebView(
        context: context,
        webUrl: session.availableProducts.installments!.webUrl,
        onResult: (WebViewResult resultCode) {
          print('*************** RESULT ***************');
          print(resultCode.name);
          loading(false);
          if(resultCode.name == "authorized"){
            cartController.alwaysCheckoutRequestToDone("tabby");
            Get.back();
            Get.off(SuccessPayment());
          }else if(resultCode.name == "close"){
            Get.back();
            TopSnackBar.warning(context, context.localizations.something_wrong);
          }else{
            Get.back();
          }
        },
      );
    }catch(e){
      loading(false);
      TopSnackBar.warning(context, context.localizations.something_wrong);
      e.printError();
    }
  }
}
