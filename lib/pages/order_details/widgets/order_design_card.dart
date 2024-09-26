import 'package:is_app/controller/constant.dart';
import 'package:is_app/data/constants/api_constants.dart';
import 'package:is_app/data/models/response/profile/order_details_response.dart';
import 'package:is_app/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OrderDesignCard extends StatelessWidget {
  int index;
  OrderItems orderItems;

  OrderDesignCard(this.index, this.orderItems);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: const EdgeInsets.only(bottom: 20),
      padding: EdgeInsets.symmetric(horizontal: Get.width * 0.05),
      child: Row(
        children: [
          Container(
            width: Get.height * 0.15,
            height: Get.height * 0.15,
            decoration: BoxDecoration(
                color: Colors.grey, borderRadius: BorderRadius.circular(10),
                image: DecorationImage(image: NetworkImage('$baseUrl/uploads/${orderItems.images!.split(",")[0]}'))
            ),
          ),
          const SizedBox(width: 10),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Get.width*0.5,
                child: Text(
                  Constant.isEnglish() ?
                  orderItems.title!
                      : orderItems.arTitle!,
                  style: textStyleForListTitle,
                ),
              ),
              const SizedBox(height: 5),
              Text(
                orderItems.price!.toStringAsFixed(2)+' SAR',
                style: textStyleForListTitle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
