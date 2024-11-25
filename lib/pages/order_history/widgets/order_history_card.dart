import 'package:is_app/controller/constant.dart';
import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/order_history/controller.dart';
import 'package:is_app/res/color.dart';
import 'package:is_app/res/images.dart';
import 'package:is_app/res/styles.dart';
import 'package:is_app/widgets/custom_svg_pic/custom_svg_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderHistoryCard extends StatelessWidget {
  OrderHistoryCard({required this.index, Key? key}) : super(key: key);
  final OrderHistoryController orderHistoryController = Get.find();
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        orderHistoryController.selectedOrder =
            orderHistoryController.orderHistoryList[index].orderId!;
        Get.toNamed('/orderDetails');
      },
      child: Container(
        width: Get.width * 0.9,
        height: Get.height * 0.14,
        color: Colors.white,
        margin: const EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            countDate(context),
            orderNumber(context),
            totalPrice(context),
            orderStatus(),
            Divider(color: black.withOpacity(0.3), thickness: 1, height: 0)
          ],
        ),
      ),
    );
  }

  countDate(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomSvgImage(width: 20, height: 20, image: CART2),
            SizedBox(width: 5),
            Text(
                '${orderHistoryController.orderHistoryList[index].designCount} ${context.localizations.designs}')
          ],
        ),
        Text(
          Constant.dateFormat(orderHistoryController
              .orderHistoryList[index].createdAt
              .toString()),
          style: textStyleForListGreyText,
        )
      ],
    );
  }

  orderNumber(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.localizations.order_number,
          style: textStyleForListGreyText,
        ),
        Text(
          '#${orderHistoryController.orderHistoryList[index].orderId.toString()}',
          style: textStyleForListBlackBoldText,
        )
      ],
    );
  }

  totalPrice(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          context.localizations.total_price,
          style: textStyleForListGreyText,
        ),
        Text(
          Constant.numberFormat(
              orderHistoryController.orderHistoryList[index].total.toString()),
          style: textStyleForListBlackBoldText,
        )
      ],
    );
  }

  orderStatus() {
    return Row(
      children: [
        Icon(
          Icons.circle,
          color: orderHistoryController.checkStatus(index) == 1
              ? Colors.green
              : orderHistoryController.checkStatus(index) == 2
                  ? Colors.amber
                  : primaryColor,
          size: 12,
        ),
        SizedBox(width: 4),
        Text(
          orderHistoryController.orderHistoryList[index].status.toString(),
          style: orderHistoryController.checkStatus(index) == 1
              ? textStyleForListGreenText
              : orderHistoryController.checkStatus(index) == 2
                  ? textStyleForListYellowText
                  : textStyleForListPrimaryText,
        ),
      ],
    );
  }
}
