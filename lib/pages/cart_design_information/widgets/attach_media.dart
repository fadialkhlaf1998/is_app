import 'package:is_app/data/constants/api_constants.dart';
import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/cart_design_information/controller.dart';
import 'package:is_app/res/color.dart';
import 'package:is_app/res/images.dart';
import 'package:is_app/widgets/custom_svg_pic/custom_svg_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AttachMedia extends StatelessWidget {
  AttachMedia({Key? key}) : super(key: key);
  final CartDesignInfoController cartDesignInfoController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        width: Get.width * 0.95,
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: Column(
          children: [
            Row(
              children: [
                const CustomSvgImage(
                    width: 20, height: 20, image: ATTACH_MEDIA),
                const SizedBox(width: 5),
                Text(context.localizations.attach_media),
              ],
            ),
            const SizedBox(height: 10),
            GridView(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                childAspectRatio: 1 / 1,
                crossAxisCount: 3,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              children: [
                GestureDetector(
                  onTap: () {
                    cartDesignInfoController.openImageOptions(1);
                  },
                  child: Container(
                    padding: EdgeInsets.all(cartDesignInfoController
                                    .cartDesignDetails.files!.corner1 ==
                                '' &&
                            cartDesignInfoController.corner1.value.path == ''
                        ? 20
                        : 0),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: primaryColor.withOpacity(0.5), width: 1),
                    ),
                    child: cartDesignInfoController.corner1.value.path != ''
                        ? Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.file(
                                cartDesignInfoController.corner1.value,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : cartDesignInfoController
                                    .cartDesignDetails.files!.corner1 ==
                                ""
                            ? CustomSvgImage(
                                width: Get.width * 0.2,
                                height: Get.width * 0.2,
                                image: cartDesignInfoController
                                    .attachMediaImageList[0],
                              )
                            : Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    '$baseUrl/uploads/${cartDesignInfoController.cartDesignDetails.files!.corner1}',
                                    fit: BoxFit.cover,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
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
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                                : null,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    cartDesignInfoController.openImageOptions(2);
                  },
                  child: Container(
                    padding: EdgeInsets.all(cartDesignInfoController
                                    .cartDesignDetails.files!.corner2 ==
                                '' &&
                            cartDesignInfoController.corner2.value.path == ''
                        ? 20
                        : 0),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: primaryColor.withOpacity(0.5), width: 1),
                    ),
                    child: cartDesignInfoController.corner2.value.path != ''
                        ? Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.file(
                                cartDesignInfoController.corner2.value,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : cartDesignInfoController
                                    .cartDesignDetails.files!.corner2 ==
                                ""
                            ? CustomSvgImage(
                                width: Get.width * 0.2,
                                height: Get.width * 0.2,
                                image: cartDesignInfoController
                                    .attachMediaImageList[1],
                              )
                            : Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    '$baseUrl/uploads/${cartDesignInfoController.cartDesignDetails.files!.corner2}',
                                    fit: BoxFit.cover,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
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
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                                : null,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    cartDesignInfoController.openImageOptions(3);
                  },
                  child: Container(
                    padding: EdgeInsets.all(cartDesignInfoController
                                    .cartDesignDetails.files!.corner3 ==
                                '' &&
                            cartDesignInfoController.corner3.value.path == ''
                        ? 20
                        : 0),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: primaryColor.withOpacity(0.5), width: 1),
                    ),
                    child: cartDesignInfoController.corner3.value.path != ''
                        ? Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.file(
                                cartDesignInfoController.corner3.value,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : cartDesignInfoController
                                    .cartDesignDetails.files!.corner3 ==
                                ""
                            ? CustomSvgImage(
                                width: Get.width * 0.2,
                                height: Get.width * 0.2,
                                image: cartDesignInfoController
                                    .attachMediaImageList[2],
                              )
                            : Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    '$baseUrl/uploads/${cartDesignInfoController.cartDesignDetails.files!.corner3}',
                                    fit: BoxFit.cover,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
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
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                                : null,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    cartDesignInfoController.openImageOptions(4);
                  },
                  child: Container(
                    padding: EdgeInsets.all(cartDesignInfoController
                                    .cartDesignDetails.files!.corner4 ==
                                '' &&
                            cartDesignInfoController.corner4.value.path == ''
                        ? 20
                        : 0),
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          color: primaryColor.withOpacity(0.5), width: 1),
                    ),
                    child: cartDesignInfoController.corner4.value.path != ''
                        ? Container(
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.file(
                                cartDesignInfoController.corner4.value,
                                fit: BoxFit.cover,
                              ),
                            ),
                          )
                        : cartDesignInfoController
                                    .cartDesignDetails.files!.corner4 ==
                                ""
                            ? CustomSvgImage(
                                width: Get.width * 0.2,
                                height: Get.width * 0.2,
                                image: cartDesignInfoController
                                    .attachMediaImageList[3],
                              )
                            : Container(
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(20),
                                  child: Image.network(
                                    '$baseUrl/uploads/${cartDesignInfoController.cartDesignDetails.files!.corner4}',
                                    fit: BoxFit.cover,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
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
                                            value: loadingProgress
                                                        .expectedTotalBytes !=
                                                    null
                                                ? loadingProgress
                                                        .cumulativeBytesLoaded /
                                                    loadingProgress
                                                        .expectedTotalBytes!
                                                : null,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    cartDesignInfoController.pickFile(1);
                  },
                  child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: primaryColor.withOpacity(0.5), width: 1),
                      ),
                      child: cartDesignInfoController.pdfMedia.value.path != ''
                          ? Icon(Icons.check_circle,
                              color: Colors.green, size: 40)
                          : cartDesignInfoController
                                      .cartDesignDetails.files!.pdf ==
                                  ""
                              ? CustomSvgImage(
                                  width: Get.width * 0.2,
                                  height: Get.width * 0.2,
                                  image: cartDesignInfoController
                                      .attachMediaImageList[4],
                                )
                              : Icon(Icons.check_circle,
                                  color: Colors.green, size: 40)),
                ),
                GestureDetector(
                  onTap: () {
                    cartDesignInfoController.pickFile(2);
                  },
                  child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            color: primaryColor.withOpacity(0.5), width: 1),
                      ),
                      child: cartDesignInfoController.dwgMedia.value.path != ''
                          ? Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 40,
                            )
                          : cartDesignInfoController
                                      .cartDesignDetails.files!.dwg ==
                                  ""
                              ? CustomSvgImage(
                                  width: Get.width * 0.2,
                                  height: Get.width * 0.2,
                                  image: cartDesignInfoController
                                      .attachMediaImageList[5],
                                )
                              : Icon(
                                  Icons.check_circle,
                                  color: Colors.green,
                                  size: 40,
                                )),
                ),
              ],
            )
          ],
        ),
      );
    });
  }
}
