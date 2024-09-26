import 'package:is_app/controller/constant.dart';
import 'package:is_app/data/constants/api_constants.dart';
import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/cart_design_information/controller.dart';
import 'package:is_app/pages/cart_design_information/widgets/attach_media.dart';
import 'package:is_app/pages/cart_design_information/widgets/dimensions_text_fields.dart';
import 'package:is_app/pages/cart_design_information/widgets/image_options.dart';
import 'package:is_app/res/color.dart';
import 'package:is_app/res/styles.dart';
import 'package:is_app/widgets/button/custom_button.dart';
import 'package:is_app/widgets/pop_up/custom_pop_up.dart';
import 'package:is_app/widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartDesignInfoPage extends StatelessWidget {
  CartDesignInfoPage({Key? key}) : super(key: key);
  final CartDesignInfoController cartDesignInfoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          title: Constant.isEnglish()
              ? Text(
            cartDesignInfoController.cartDesignDetails.title.toString() +
                ' ' +
                context.localizations.details,
            style: textStyleForTitle,
          ) : Text(
            context.localizations.details + ' ' + cartDesignInfoController.cartDesignDetails.arTitle.toString(),
            style: textStyleForTitle,
          ),
          backgroundColor: white,
          elevation: 0.0,
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
          child: Stack(
            children: [
              SingleChildScrollView(
                child: Container(
                  child: Column(
                    children: [
                      _header(),
                      DimensionsTextFields(),
                      CustomTextField(
                          width: 0.95,
                          height: 0.15,
                          labelText: context.localizations.notes,
                          controller: cartDesignInfoController.noteController,
                          onChange: (value) {
                            if (value.isNotEmpty) {
                              cartDesignInfoController.cartDesignDetails.note =
                                  value;
                            }
                            cartDesignInfoController.checkChange();
                          },
                          textInputType: TextInputType.text),
                      AttachMedia(),
                      const SizedBox(height: 15),
                      Obx(() {
                        return !cartDesignInfoController.sameData.value ||
                                !cartDesignInfoController.sameFile.value
                            ? CustomButton(
                                width: 0.6,
                                height: 0.05,
                                color: primaryColor,
                                loading: cartDesignInfoController.loading.value,
                                title: context.localizations.save,
                                onTap: () {
                                  cartDesignInfoController
                                      .updateCartRequest(context);
                                },
                                textStyle: textStyleForButton)
                            : const SizedBox();
                      }),
                      const SizedBox(height: 30),
                    ],
                  ),
                ),
              ),
              CustomPopUp(
                  open: cartDesignInfoController.imageChosePopUp.value,
                  outSideOnTap: () {
                    cartDesignInfoController.imageChosePopUp.value = false;
                  },
                  child: ImageOptions()),
            ],
          ),
        ),
      );
    });
  }

  _header() {
    return Container(
      height: Get.height * 0.15,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          Container(
            height: Get.height * 0.15,
            width: Get.height * 0.15,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                '$baseUrl/uploads/${cartDesignInfoController.cartDesignDetails.images!.split(',')[0]}',
                fit: BoxFit.cover,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Center(
                    child: SizedBox(
                      width: Get.width * 0.05,
                      height: Get.width * 0.05,
                      child: CircularProgressIndicator(
                        color: primaryColor,
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: Get.width * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: Get.width * 0.3,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 2),
                  decoration: BoxDecoration(
                      color: loadingColor1,
                      borderRadius: BorderRadius.circular(40)),
                  child: Center(
                    child: Text(
                      Constant.isEnglish() ?
                      cartDesignInfoController.cartDesignDetails.category
                          .toString() : cartDesignInfoController.cartDesignDetails.arCategory.toString(),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: textStyleForSmallBlackText,
                    ),
                  ),
                ),
                Text(
                  Constant.isEnglish() ?
                  cartDesignInfoController.cartDesignDetails.title.toString()
                  :cartDesignInfoController.cartDesignDetails.arTitle.toString(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: textStyleForListTitle,
                ),
                Text(
                  Constant.numberFormat(cartDesignInfoController
                      .cartDesignDetails.price
                      .toString()),
                  style: textStyleForNormalColorText,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
