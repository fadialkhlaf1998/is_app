import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/order_history/controller.dart';
import 'package:is_app/pages/order_history/widgets/order_history_card.dart';
import 'package:is_app/res/color.dart';
import 'package:is_app/res/styles.dart';
import 'package:is_app/widgets/loading/custom_loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderHistoryPage extends StatelessWidget {
  OrderHistoryPage({Key? key}) : super(key: key);
  final OrderHistoryController orderHistoryController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          backgroundColor: white,
          elevation: 0.0,
          title: Text(context.localizations.order_history,
              style: textStyleForTitle),
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
        body: SafeArea(
          child: Container(
              width: Get.width,
              margin: const EdgeInsets.only(top: 10),
              child: CustomLoading(
                  loading: orderHistoryController.loading.value,
                  child: orderHistoryController.orderHistoryList.isNotEmpty
                      ? ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount:
                              orderHistoryController.orderHistoryList.length,
                          itemBuilder: (BuildContext context, index) {
                            return OrderHistoryCard(index: index);
                          },
                        )
                      : Center(child: Text(context.localizations.list_empty)))),
        ),
      );
    });
  }
}
