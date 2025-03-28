import 'package:is_app/controller/constant.dart';
import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/cart/controller.dart';
import 'package:is_app/pages/my_fatoora/fail.dart';
import 'package:is_app/pages/my_fatoora/index.dart';
import 'package:is_app/pages/my_fatoora/payment_options_page.dart';
import 'package:is_app/pages/my_fatoora/success.dart';
import 'package:is_app/res/color.dart';
import 'package:is_app/res/styles.dart';
import 'package:is_app/widgets/button/custom_button.dart';
import 'package:is_app/widgets/loading/loading_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tabby_flutter_inapp_sdk/tabby_flutter_inapp_sdk.dart';

class Footer extends StatelessWidget {
  Footer({Key? key}) : super(key: key);
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        height: 270,
        width: Get.width,
        padding:
            const EdgeInsets.only(right: 10, left: 10, top: 10, bottom: 15),
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20), topLeft: Radius.circular(20)),
          color: white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TabbyPresentationSnippet(
              price: cartController.myCart.total.toString(),
              currency: Currency.sar,
              lang: Constant.isEnglish()?Lang.en:Lang.ar,
            ),
            _cartRow(context.localizations.sub_total,
                cartController.myCart.subTotal.toString()),
            _cartRow(context.localizations.discount,
                cartController.myCart.discount.toString()),
            _cartRow(context.localizations.vat,
                cartController.myCart.vat.toString()),
            _cartRow(context.localizations.total,
                cartController.myCart.total.toString()),
            Text(context.localizations.tax),
            const SizedBox(height: 5),

            CustomButton(
                width: 0.7,
                height: 0.05,
                color: primaryColor,
                title: context.localizations.checkout,
                loading: cartController.loadingCheck.value,
                onTap: () async {
                  /// todo
                  /// my fatoora
                  // await cartController.checkoutRequest(context);
                  Get.to(PaymentOptionsPage(cartController.myCart.total!.toString()));
                },
                textStyle: textStyleForButton)
          ],
        ),
      );
    });
  }

  _cartRow(title, number) {
    return Row(
      children: [
        Text(
          title,
          style: textStyleForListTitle,
        ),
        Flexible(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                final boxWidth = constraints.constrainWidth();
                double dashWidth = 5.0;
                double dashHeight = 1.0;
                final dashCount = (boxWidth / (2 * dashWidth)).floor();
                return Flex(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  direction: Axis.horizontal,
                  children: List.generate(dashCount, (_) {
                    return SizedBox(
                      width: dashWidth,
                      height: dashHeight,
                      child: const DecoratedBox(
                        decoration: BoxDecoration(color: Colors.grey),
                      ),
                    );
                  }),
                );
              },
            ),
          ),
        ),
        cartController.loading.value
            ? LoadingContainer(width: 0.1, height: 0.02)
            : Text(
                Constant.numberFormat(number),
                style: textStyleForListTitle,
              ),
      ],
    );
  }
}
