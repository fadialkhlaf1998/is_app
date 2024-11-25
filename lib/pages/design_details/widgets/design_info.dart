import 'package:is_app/controller/constant.dart';
import 'package:is_app/pages/design_details/controller.dart';
import 'package:is_app/res/styles.dart';
import 'package:is_app/widgets/loading/loading_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DesignInfo extends StatelessWidget {
  DesignInfo({Key? key}) : super(key: key);
  final DesignDetailsController designDetailsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          !designDetailsController.loading.value
              ? Text(
                  Constant.isEnglish()
                      ? designDetailsController.selectDesignDetails.title
                          .toString()
                      : designDetailsController.selectDesignDetails.arTitle
                          .toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 3,
                  style: textStyleForBoldTitle,
                )
              : LoadingContainer(width: 0.15, height: 0.025),
          const SizedBox(height: 5),
          !designDetailsController.loading.value
              ? Text(
                  '${designDetailsController.selectDesignDetails.price} SAR',
                  style: textStyleForListTitle,
                )
              : LoadingContainer(width: 0.15, height: 0.025),
          const SizedBox(height: 10),
          !designDetailsController.loading.value
              ? Text(
                  Constant.isEnglish()
                      ? designDetailsController.selectDesignDetails.description
                          .toString()
                      : designDetailsController
                          .selectDesignDetails.arDescription
                          .toString(),
                  maxLines: 20,
                  style: textStyleForListTitle,
                )
              : LoadingContainer(width: 0.8, height: 0.15),
        ],
      ),
    );
  }
}
