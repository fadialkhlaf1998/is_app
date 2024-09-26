import 'dart:convert';
import 'dart:io';
import 'package:is_app/pages/cart/controller.dart';
import 'package:is_app/pages/my_fatoora/fail.dart';
import 'package:is_app/pages/my_fatoora/success.dart';
import 'package:is_app/res/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myfatoorah_flutter/MFApplePayButton.dart';
import 'package:myfatoorah_flutter/MFCardView.dart';
import 'package:myfatoorah_flutter/MFGooglePayButton.dart';
import 'package:myfatoorah_flutter/MFModels.dart';
import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';
// import 'package:myfatoorah_flutter/myfatoorah_flutter.dart';


final String mAPIKey = "";
final String testAPIKey = "rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL";

class MyFatoraahPage extends StatefulWidget {

  MyFatoraahPage(this.title,this.total);

  final String title;
  final String total;

  @override
  _MyHomePageState createState() => _MyHomePageState(total);
}

class _MyHomePageState extends State<MyFatoraahPage> {

  CartController cartController = Get.find();

  _MyHomePageState(this.amount);


  String? _response = '';
  MFInitiateSessionResponse? session;

  List<MFPaymentMethod> paymentMethods = [];
  List<bool> isSelected = [];
  int selectedPaymentMethodIndex = -1;

  String cardNumber = "5453010000095489";
  String expiryMonth = "05";
  String expiryYear = "21";
  String securityCode = "100";
  String cardHolderName = "Test Account";

  String amount = "5.00";
  bool visibilityObs = false;
  late MFCardPaymentView mfCardView;
  late MFApplePayButton mfApplePayButton;
  late MFGooglePayButton mfGooglePayButton;

  @override
  void initState() {
    super.initState();
    initiate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  initiate() async {
    // if (Config.testAPIKey.isEmpty) {
    //   setState(() {
    //     _response =
    //     "Missing API Token Key.. You can get it from here: https://myfatoorah.readme.io/docs/test-token";
    //   });
    //   return;
    // }

    // TODO, don't forget to init the MyFatoorah Plugin with the following line
    await MFSDK.init(mAPIKey, MFCountry.SAUDIARABIA, MFEnvironment.LIVE);
    // (Optional) un comment the following lines if you want to set up properties of AppBar.
    // MFSDK.setUpActionBar(
    //     toolBarTitle: 'Company Payment',
    //     toolBarTitleColor: '#FFEB3B',
    //     toolBarBackgroundColor: '#CA0404',
    //     isShowToolBar: true);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await initiateSessionForCardView();
      await initiateSessionForGooglePay();
      await initiatePayment();
      // await initiateSession();
    });
  }

  log(Object object) {
    print('**** HERE ****');
    print(object);
    if(object is MFGetPaymentStatusResponse){
      print('*****');
      print(object.invoiceStatus!);
      if(object.invoiceStatus != null && object.invoiceStatus == 'Paid'){
        //todo successfully payment

        // print(invoiceId);
        // print(result.response!.toJson());
        // _response = result.response!.toJson().toString();
        cartController.alwaysCheckoutRequestToDone();
        Get.to(SuccessPayment());
      }else{
        // checkoutController.selected.value=false;
        //todo fail payment
        Get.to(FailPayment());
      }
    }
    var json = const JsonEncoder.withIndent('  ').convert(object);
    setState(() {
      debugPrint(json);
      _response = json;

    });
  }

  // Send Payment
  sendPayment() async {
    var request = MFSendPaymentRequest(
        invoiceValue: double.parse(amount),
        customerName: "Customer name",
        notificationOption: MFNotificationOption.LINK);
    // var invoiceItem = MFInvoiceItem(itemName: "item1", quantity: 1, unitPrice: 1);
    // request.invoiceItems = [invoiceItem];

    await MFSDK
        .sendPayment(request, MFLanguage.ENGLISH)
        .then((value) => log(value))
        .catchError((error) => {log(error)});
  }

  // Initiate Payment
  initiatePayment() async {
    var request = MFInitiatePaymentRequest(
        invoiceAmount: double.parse(amount),
        currencyIso: MFCurrencyISO.SAUDIARABIA_SAR);

    await MFSDK
        .initiatePayment(request, MFLanguage.ENGLISH)
        .then((value) => {
      log(value),
      paymentMethods.addAll(value.paymentMethods!),
      for (int i = 0; i < paymentMethods.length; i++)
        isSelected.add(false)
    })
        .catchError((error) => {log(error.message)});
  }

  // Execute Regular Payment
  executeRegularPayment(int paymentMethodId) async {
    var request = MFExecutePaymentRequest(
        paymentMethodId: paymentMethodId, invoiceValue: double.parse(amount));
    request.displayCurrencyIso = MFCurrencyISO.SAUDIARABIA_SAR;

    // var recurring = MFRecurringModel();
    // recurring.intervalDays = 10;
    // recurring.recurringType = MFRecurringType.Custom;
    // recurring.iteration = 2;
    // request.recurringModel = recurring;

    await MFSDK
        .executePayment(request, MFLanguage.ENGLISH, (invoiceId) {
      log(invoiceId);
    })
        .then((value) => log(value))
        .catchError((error) => {log(error.message)});
  }

  //Execute Direct Payment
  executeDirectPayment(int paymentMethodId, bool isToken) async {
    var request = MFExecutePaymentRequest(
        paymentMethodId: paymentMethodId, invoiceValue: double.parse(amount));

    var token = isToken ? "TOKEN210282" : null;
    var mfCardRequest = isToken
        ? null
        : MFCard(
      cardHolderName: cardHolderName,
      number: cardNumber,
      expiryMonth: expiryMonth,
      expiryYear: expiryYear,
      securityCode: securityCode,
    );

    var directPaymentRequest = MFDirectPaymentRequest(
        executePaymentRequest: request, token: token, card: mfCardRequest);
    log(directPaymentRequest);
    await MFSDK
        .executeDirectPayment(directPaymentRequest, MFLanguage.ENGLISH,
            (invoiceId) {
          debugPrint("-----------$invoiceId------------");
          log(invoiceId);
        })
        .then((value) => log(value))
        .catchError((error) => {log(error.message)});
  }

  // Payment Enquiry
  getPaymentStatus() async {
    MFGetPaymentStatusRequest request =
    MFGetPaymentStatusRequest(key: '1515410', keyType: MFKeyType.INVOICEID);

    await MFSDK
        .getPaymentStatus(request, MFLanguage.ENGLISH)
        .then((value) => log(value))
        .catchError((error) => {log(error.message)});
  }

  // Cancel Token
  cancelToken() async {
    await MFSDK
        .cancelToken("Put your token here", MFLanguage.ENGLISH)
        .then((value) => log(value))
        .catchError((error) => {log(error.message)});
  }

  // Cancel Recurring Payment
  cancelRecurringPayment() async {
    await MFSDK
        .cancelRecurringPayment("Put RecurringId here", MFLanguage.ENGLISH)
        .then((value) => log(value))
        .catchError((error) => {log(error.message)});
  }

  setPaymentMethodSelected(int index, bool value) {
    for (int i = 0; i < isSelected.length; i++) {
      if (i == index) {
        isSelected[i] = value;
        if (value) {
          selectedPaymentMethodIndex = index;
          visibilityObs = paymentMethods[index].isDirectPayment!;
        } else {
          selectedPaymentMethodIndex = -1;
          visibilityObs = false;
        }
      } else {
        isSelected[i] = false;
      }
    }
  }

  executePayment() {
    if (selectedPaymentMethodIndex == -1) {
      setState(() {
        _response = "Please select payment method first";
      });
    } else {
      if (amount.isEmpty) {
        setState(() {
          _response = "Set the amount";
        });
      } else if (paymentMethods[selectedPaymentMethodIndex].isDirectPayment!) {
        if (cardNumber.isEmpty ||
            expiryMonth.isEmpty ||
            expiryYear.isEmpty ||
            securityCode.isEmpty) {
          setState(() {
            _response = "Fill all the card fields";
          });
        } else {
          executeDirectPayment(
              paymentMethods[selectedPaymentMethodIndex].paymentMethodId!,
              false);
        }
      } else {
        executeRegularPayment(
            paymentMethods[selectedPaymentMethodIndex].paymentMethodId!);
      }
    }
  }

  MFCardViewStyle cardViewStyle() {
    MFCardViewStyle cardViewStyle = MFCardViewStyle();
    cardViewStyle.cardHeight = 200;
    cardViewStyle.hideCardIcons = false;
    cardViewStyle.input?.inputMargin = 3;
    cardViewStyle.label?.display = true;
    cardViewStyle.input?.fontFamily = MFFontFamily.TimesNewRoman;
    cardViewStyle.label?.fontWeight = MFFontWeight.Light;
    return cardViewStyle;
  }

  // applePayPayment() async {
  //   MFExecutePaymentRequest executePaymentRequest =
  //       MFExecutePaymentRequest(invoiceValue: 10);
  //   executePaymentRequest.displayCurrencyIso = MFCurrencyISO.KUWAIT_KWD;

  //   await mfApplePayButton
  //       .applePayPayment(executePaymentRequest, MFLanguage.ENGLISH,
  //           (invoiceId) {
  //         log(invoiceId);
  //       })
  //       .then((value) => log(value))
  //       .catchError((error) => {log(error.message)});
  // }

  initiateSessionForCardView() async {
    /*
      If you want to use saved card option with embedded payment, send the parameter
      "customerIdentifier" with a unique value for each customer. This value cannot be used
      for more than one Customer.
     */
    // var request = MFInitiateSessionRequest("12332212");
    /*
      If not, then send null like this.
     */
    MFInitiateSessionRequest initiateSessionRequest =
    MFInitiateSessionRequest();

    await MFSDK
        .initSession(initiateSessionRequest, MFLanguage.ENGLISH)
        .then((value) => loadEmbeddedPayment(value))
        .catchError((error) => {log(error.message)});
  }

  loadCardView(MFInitiateSessionResponse session) {
    mfCardView.load(session, (bin) {
      log(bin);
    });
  }

  loadEmbeddedPayment(MFInitiateSessionResponse session) async {
    MFExecutePaymentRequest executePaymentRequest =
    MFExecutePaymentRequest(invoiceValue: 10);
    executePaymentRequest.displayCurrencyIso = MFCurrencyISO.SAUDIARABIA_SAR;
    await loadCardView(session);
    if (Platform.isIOS) {
      applePayPayment(session);
      MFApplepay.setupApplePay(
          session, executePaymentRequest, MFLanguage.ENGLISH);
    }
  }

  openPaymentSheet() {
    if (Platform.isIOS) {
      MFApplepay.executeApplePayPayment()
          .then((value) => log(value))
          .catchError((error) => {log(error.message)});
    }
  }

  updateAmounnt() {
    if (Platform.isIOS) MFApplepay.updateAmount(double.parse(amount));
  }

  applePayPayment(MFInitiateSessionResponse session) async {
    MFExecutePaymentRequest executePaymentRequest =
    MFExecutePaymentRequest(invoiceValue: 10);
    executePaymentRequest.displayCurrencyIso = MFCurrencyISO.SAUDIARABIA_SAR;

    await mfApplePayButton
        .displayApplePayButton(
        session, executePaymentRequest, MFLanguage.ENGLISH)
        .then((value) => {
      log(value),
      mfApplePayButton
          .executeApplePayButton(null, (invoiceId) => log(invoiceId))
          .then((value) => log(value))
          .catchError((error) => {log(error.message)})
    })
        .catchError((error) => {log(error.message)});
  }

  initiateSession() async {
    /*
      If you want to use saved card option with embedded payment, send the parameter
      "customerIdentifier" with a unique value for each customer. This value cannot be used
      for more than one Customer.
     */
    // var request = MFInitiateSessionRequest("12332212");
    /*
      If not, then send null like this.
     */
    MFInitiateSessionRequest initiateSessionRequest =
    MFInitiateSessionRequest();
    await MFSDK
        .initiateSession(initiateSessionRequest, (bin) {
      log(bin);
    })
        .then((value) => {log(value)})
        .catchError((error) => {log(error.message)});
  }

  pay() async {
    var executePaymentRequest = MFExecutePaymentRequest(invoiceValue: 10);

    await mfCardView
        .pay(executePaymentRequest, MFLanguage.ENGLISH, (invoiceId) {
      debugPrint("-----------$invoiceId------------");
      log(invoiceId);
    })
        .then((value) => log(value))
        .catchError((error) => {log(error.message)});
  }

  validate() async {
    await mfCardView
        .validate()
        .then((value) => log(value))
        .catchError((error) => {log(error.message)});
  }

  // GooglePay Section
  initiateSessionForGooglePay() async {
    MFInitiateSessionRequest initiateSessionRequest = MFInitiateSessionRequest(
      // A uniquue value for each customer must be added
        customerIdentifier: "12332212");

    await MFSDK
        .initSession(initiateSessionRequest, MFLanguage.ENGLISH)
        .then((value) => {setupGooglePayHelper(value.sessionId)})
        .catchError((error) => {log(error.message)});
  }

  setupGooglePayHelper(String sessionId) async {
    MFGooglePayRequest googlePayRequest = MFGooglePayRequest(
        totalPrice: amount,
        merchantId: "No googleMerchantId",
        merchantName: "Test Vendor",
        countryCode: MFCountry.SAUDIARABIA,
        currencyIso: MFCurrencyISO.SAUDIARABIA_SAR);

    await mfGooglePayButton
        .setupGooglePayHelper(sessionId, googlePayRequest, (invoiceId) {
      log("-----------Invoice Id: $invoiceId------------");
    })
        .then((value) => log(value))
        .catchError((error) => {log(error.message)});
  }

//#region aaa

//endregion

  // UI Section
  @override
  Widget build(BuildContext context) {
    mfCardView = MFCardPaymentView(cardViewStyle: cardViewStyle());
    mfApplePayButton = MFApplePayButton(applePayStyle: MFApplePayStyle());
    mfGooglePayButton = MFGooglePayButton();

    return MaterialApp(
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          toolbarHeight: 1,
          //   title: const Text('Plugin example app'),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Flex(
              direction: Axis.vertical,
              children: [
                Text("Payment Amount", style: textStyle()),
                amountInput(),
                // if (Platform.isAndroid) googlePayButton(),
                // btn("Reload GooglePay", initiateSessionForGooglePay),
                // embeddedCardView(),
                // if (Platform.isIOS) applePayView(),
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          paymentMethodsList(),
                          visibilityObs
                              ? directPaymentCardDetails()
                              : const Column(),
                          if (selectedPaymentMethodIndex != -1)
                            btn("Pay", executePayment),
                          // btn("Send Payment", sendPayment),
                          // btn("Get Payment Status", getPaymentStatus),
                          // if (Platform.isIOS)
                          //   btn("Update Amount", updateAmounnt),
                          // if (Platform.isIOS)
                          //   btn("Reload Apple Pay", applePayPayment),
                          // if (Platform.isIOS)
                          //   btn("New Apple Pay", openPaymentSheet),
                          // ColoredBox(
                          //   color: const Color(0xFFD8E5EB),
                          //   child: SelectableText.rich(
                          //     TextSpan(
                          //       text: _response!,
                          //       style: const TextStyle(),
                          //     ),
                          //   ),
                          // ),
                        ]),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget embeddedCardView() {
    return Column(
      children: [
        SizedBox(
          height: 180,
          child: mfCardView,
        ),
        Row(
          children: [
            Expanded(child: elevatedButton("Validate", validate)),
            const SizedBox(width: 2),
            Expanded(child: elevatedButton("Pay", pay)),
            const SizedBox(width: 2),
            elevatedButton("", initiateSessionForCardView),
          ],
        )
      ],
    );
  }

  Widget applePayView() {
    return Column(
      children: [
        SizedBox(
          height: 50,
          child: mfApplePayButton,
        )
      ],
    );
  }

  Widget googlePayButton() {
    return SizedBox(
      height: 70,
      child: mfGooglePayButton,
    );
  }

  Widget directPaymentCardDetails() {
    return Column(
      children: <Widget>[
        const Padding(
          padding: EdgeInsets.all(2.5),
        ),
        TextField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: "Card Number"),
          controller: TextEditingController(text: cardNumber),
          onChanged: (value) {
            cardNumber = value;
          },
        ),
        TextField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: "Expiry Month"),
          controller: TextEditingController(text: expiryMonth),
          onChanged: (value) {
            expiryMonth = value;
          },
        ),
        TextField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: "Expiry Year"),
          controller: TextEditingController(text: expiryYear),
          onChanged: (value) {
            expiryYear = value;
          },
        ),
        TextField(
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(labelText: "Security Code"),
          controller: TextEditingController(text: securityCode),
          onChanged: (value) {
            securityCode = value;
          },
        ),
        TextField(
          keyboardType: TextInputType.name,
          decoration: const InputDecoration(labelText: "Card Holder Name"),
          controller: TextEditingController(text: cardHolderName),
          onChanged: (value) {
            cardHolderName = value;
          },
        ),
      ],
    );
  }

  Widget paymentMethodsList() {
    return Column(
      children: [
        SizedBox(height: 25,),
        Container(
          width: Get.width*0.3,
          color: primaryColor,
          child: Image.asset("assets/icons/logo_png.png"),
        ),

        SizedBox(height: 25,),
        Text("Select payment method", style: textStyle()),
        SizedBox(
          height: Get.height * 0.5,
          child: ListView.builder(
              shrinkWrap: true,
              // scrollDirection: Axis.horizontal,
              itemCount: paymentMethods.length,
              itemBuilder: (BuildContext ctxt, int index) {
                return paymentMethodsItem(ctxt, index);
              }),
        ),
      ],
    );
  }

  Widget paymentMethodsItem(BuildContext ctxt, int index) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(width: 1,color: Colors.black.withOpacity(0.1))
        )
      ),
      child: SizedBox(
        width: Get.width,
        // height: 75,
        child: Container(
          decoration: isSelected[index]
              ? BoxDecoration(
              border: Border.all(color: Colors.blueAccent, width: 2))
              : const BoxDecoration(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[

                SizedBox(
                  height: 24.0,
                  width: 24.0,
                  child: Checkbox(
                      checkColor: Colors.blueAccent,
                      activeColor: const Color(0xFFC9C5C5),
                      shape: CircleBorder(),
                      value: isSelected[index],
                      onChanged: (bool? value) {
                        setState(() {
                          setPaymentMethodSelected(index, value!);
                        });
                      }),
                ),
                SizedBox(width: 10,),
                Text(
                  paymentMethods[index].paymentMethodEn ?? "",
                  style: TextStyle(
                    fontSize: 12.0,
                    fontWeight:
                    FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                Spacer(),
                Image.network(
                  paymentMethods[index].imageUrl!,
                  height: 25.0,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget btn(String title, Function onPressed) {
    return SizedBox(
      width: double.infinity, // <-- match_parent
      child: elevatedButton(title, onPressed),
    );
  }

  Widget elevatedButton(String title, Function onPressed) {
    return ElevatedButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
        backgroundColor:
        MaterialStateProperty.all<Color>(Colors.black),
        shape: MaterialStateProperty.resolveWith<RoundedRectangleBorder>(
              (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(color: Colors.red, width: 1.0),
              );
            } else {
              return RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
                side: const BorderSide(color: Colors.white, width: 1.0),
              );
            }
          },
        ),
      ),
      child: (title.isNotEmpty)
          ? Text(title, style: textStyle())
          : const Icon(Icons.refresh),
      onPressed: () async {
        await onPressed();
      },
    );
  }

  Widget amountInput() {
    return Text(amount+" SAR");
  }

  TextStyle textStyle() {
    return const TextStyle(fontSize: 16.0, fontStyle: FontStyle.italic);
  }



}