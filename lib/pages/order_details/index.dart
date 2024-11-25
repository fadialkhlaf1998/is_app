import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/order_details/controller.dart';
import 'package:is_app/pages/order_details/widgets/order_design_card.dart';
import 'package:is_app/res/color.dart';
import 'package:is_app/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:is_app/widgets/loading/custom_loading.dart';

class OrderDetailsPage extends StatelessWidget {
  final OrderDetailsController orderDetailsController =
      Get.put(OrderDetailsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: AppBar(
        backgroundColor: white,
        elevation: 0.0,
        title: Text(context.localizations.order, style: textStyleForTitle),
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
              color: Colors.transparent,
              child: Icon(Icons.arrow_back_ios_new_outlined,
                  color: black, size: 20)),
        ),
      ),
      body: Obx(() => SafeArea(
            child: Container(
              width: Get.width,
              child: orderDetailsController.loading.value
                  ? CustomLoading(
                      loading: true,
                      child: Center(),
                    )
                  : Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 10, horizontal: Get.width * 0.05),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                context.localizations.total_price,
                                style: textStyleForListBlackBoldText,
                              ),
                              Text(
                                orderDetailsController
                                        .orderDetailsResponse!.total!
                                        .toStringAsFixed(2) +
                                    " SAR",
                                style: textStyleForListBlackBoldText,
                              )
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: orderDetailsController
                                .orderDetailsResponse!.orderItems!.length,
                            itemBuilder: (BuildContext context, index) {
                              return OrderDesignCard(
                                  index,
                                  orderDetailsController.orderDetailsResponse!
                                      .orderItems![index]);
                            },
                          ),
                        )
                      ],
                    ),
            ),
          )),
    );
  }
}
