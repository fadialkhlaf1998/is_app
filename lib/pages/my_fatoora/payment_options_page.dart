import 'dart:developer';
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:is_app/controller/constant.dart';
import 'package:is_app/controller/init_controller.dart';
import 'package:is_app/data/constants/api_constants.dart';
import 'package:is_app/data/models/response/profile/order_history_response.dart';
import 'package:is_app/data/repository/profile_repo.dart';
import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/cart/controller.dart';
import 'package:is_app/pages/my_fatoora/index.dart';
import 'package:is_app/pages/my_fatoora/success.dart';
import 'package:is_app/pages/order_history/controller.dart';
import 'package:is_app/res/color.dart';
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

  TextEditingController phoneController = TextEditingController();
  String initialCountry = 'SA';
  String phoneNumberTabby = '';
  PhoneNumber number = PhoneNumber(isoCode: 'SA');
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
                            phonePopUp();
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
                                Text(context.localizations.tabby_snippet,style: TextStyle(fontWeight: FontWeight.bold,),),

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

  Future<void> phonePopUp() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(context.localizations.phone_number),
          content: SingleChildScrollView(
            child: Obx(()=>
            loading.value?Center(child: CircularProgressIndicator(color: primaryColor,),):
                ListBody(
                  children: <Widget>[
                    Text(context.localizations.please_enter_phone),
                    SizedBox(height: 15,),
                    InternationalPhoneNumberInput(
                      onInputChanged: (PhoneNumber number) {
                        phoneNumberTabby = number.phoneNumber.toString();
                        print("change"+number.phoneNumber.toString());
                      },
                      onInputValidated: (bool value) {
                        print(value);
                      },
                      selectorConfig: SelectorConfig(
                        selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                        useBottomSheetSafeArea: true,
                      ),

                      ignoreBlank: false,
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: TextStyle(color: Colors.black),
                      initialValue: number,
                      textFieldController: phoneController,
                      formatInput: true,
                      keyboardType:
                      TextInputType.numberWithOptions(signed: true, decimal: true),
                      inputBorder: OutlineInputBorder(),
                      onSaved: (PhoneNumber number) {
                        print('On Saved: $number');
                      },
                    ),

                  ],
                ),)
          ),
          actions: <Widget>[
            TextButton(
              child: Text(context.localizations.cancel,style: TextStyle(color: lightBlack),),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),

            TextButton(
              child: Text(context.localizations.submit,style: TextStyle(color: primaryColor),),
              onPressed: () async {
                print(phoneNumberTabby.length);
                if(phoneNumberTabby.length >= 13) {
                  // Navigator.of(context).pop();
                  // await Duration(milliseconds: 800).delay();
                  lunch_order_tabby(context);
                }
              },
            ),

          ],
        );
      },
    );
  }

  ProfileRepo profileRepo = ProfileRepo();
  Future<List<OrderHistoryResponse>> getOrderHistoryRequest() async {
    List<OrderHistoryResponse> orderHistoryList = <OrderHistoryResponse>[];
    var value = await profileRepo.getOrderHistory();
    if (value.code == 1) {
      orderHistoryList.addAll((value.data['orders'] as List)
          .map((e) => OrderHistoryResponse.fromJson(e))
          .toList());
      return orderHistoryList;
    } else {
      return <OrderHistoryResponse>[];
    }
  }
  lunch_order_tabby(BuildContext context)async{
    CartController cartController = Get.find();
    InitController initController = Get.find();

    loading(true);
    List<OrderHistoryResponse> orderHistoryList = await getOrderHistoryRequest();
    try{
      // print('length of data'+orderHistoryList.length.toString());
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
          phone: phoneNumberTabby,
          name: initController.userData.fullName!,
        ),
        buyerHistory: BuyerHistory(
          loyaltyLevel: orderHistoryList.length,
          registeredSince: initController.userData.created_at??'2022-08-24T14:15:22Z',
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
          orderHistory: orderHistoryList.map((element) => OrderHistoryItem(
              amount: element.total.toString(),
              purchasedAt: DateFormat("yyyy-MM-ddTHH:mm:ss").format(DateTime.parse(element.createdAt!))+"+04:00",
              status: element.status! == 'pending'
                  ?OrderHistoryItemStatus.newOne
                  :element.status! == 'done'?
              OrderHistoryItemStatus.complete:OrderHistoryItemStatus.processing
          )).toList(),
      );
      final session = await TabbySDK().createSession(TabbyCheckoutPayload(
        merchantCode: 'isketch_arc_sau',
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
            cartController.alwaysCheckoutRequestToDone("tabby",orderTabbyId);
            Get.back();
            Get.off(SuccessPayment());
          }else if(resultCode.name == "close"){
            Get.back();
            TopSnackBar.warning(context, context.localizations.tabby_close_msg);
          }else{
            Get.back();
            TopSnackBar.warning(context, context.localizations.tabby_wrong_msg);
          }
        },
      );
    }catch(e){
      loading(false);
      TopSnackBar.warning(context, context.localizations.tabby_wrong_msg);
      e.printError();
    }
  }
}
