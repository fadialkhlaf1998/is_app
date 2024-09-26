import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/cart/controller.dart';
import 'package:is_app/pages/cart/widgets/cart_card.dart';
import 'package:is_app/pages/cart/widgets/footer.dart';
import 'package:is_app/res/styles.dart';
import 'package:is_app/widgets/loading/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);
  final CartController cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
        width: Get.width,
        height: Get.height,
        child: Column(
          children: [
            Container(
              width: Get.width * 0.95,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Text(
                context.localizations.my_cart,
                style: textStyleForTitle,
              ),
            ),
            Expanded(
                child: CustomLoading(
                    child: cartController.cartList.isNotEmpty
                        ? ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            itemCount: cartController.cartList.length,
                            itemBuilder: (BuildContext context, index) {
                              return CartCard(index: index);
                            },
                          )
                        : Center(child: Text(context.localizations.list_empty)),
                    loading: cartController.loading.value)),
            cartController.cartList.isNotEmpty ? Footer() : const SizedBox(),
          ],
        ),
      );
    });
  }
}
