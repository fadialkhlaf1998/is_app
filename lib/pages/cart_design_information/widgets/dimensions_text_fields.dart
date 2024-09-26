import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/cart_design_information/controller.dart';
import 'package:is_app/widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DimensionsTextFields extends StatelessWidget {
  DimensionsTextFields({Key? key}) : super(key: key);
  final CartDesignInfoController cartDesignInfoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CustomTextField(
              width: 0.3,
              height: 0.05,
              labelText: context.localizations.width,
              controller: cartDesignInfoController.widthController,
              onChange: (value) {
                if (value.isNotEmpty) {
                  cartDesignInfoController.cartDesignDetails.width =
                      int.parse(value);
                }
                cartDesignInfoController.checkChange();
              },
              textInputType: TextInputType.number),
          CustomTextField(
              width: 0.3,
              height: 0.05,
              labelText: context.localizations.height,
              controller: cartDesignInfoController.heightController,
              onChange: (value) {
                if (value.isNotEmpty) {
                  cartDesignInfoController.cartDesignDetails.height =
                      int.parse(value);
                }
                cartDesignInfoController.checkChange();
              },
              textInputType: TextInputType.number),
          CustomTextField(
              width: 0.3,
              height: 0.05,
              labelText: context.localizations.length,
              controller: cartDesignInfoController.lengthController,
              onChange: (value) {
                if (value.isNotEmpty) {
                  cartDesignInfoController.cartDesignDetails.length =
                      int.parse(value);
                }
                cartDesignInfoController.checkChange();
              },
              textInputType: TextInputType.number),
        ],
      ),
    );
  }
}
