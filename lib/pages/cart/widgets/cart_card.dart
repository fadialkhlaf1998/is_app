import 'package:is_app/controller/constant.dart';
import 'package:is_app/data/constants/api_constants.dart';
import 'package:is_app/pages/cart/controller.dart';
import 'package:is_app/res/color.dart';
import 'package:is_app/res/images.dart';
import 'package:is_app/res/styles.dart';
import 'package:is_app/widgets/custom_svg_pic/custom_svg_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartCard extends StatelessWidget {
  final int index;
  final CartController cartController = Get.find();
  CartCard({required this.index, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Container(
        width: Get.width * 0.9,
        height: Get.height * 0.17,
        padding: const EdgeInsets.symmetric(horizontal: 5),
        margin: const EdgeInsets.only(bottom: 10),
        child: Row(
          children: [
            Container(
              height: Get.height * 0.17,
              width: Get.height * 0.17,
              color: Colors.transparent,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  '$baseUrl/uploads/${cartController.cartList[index].images!.split(',')[0]}',
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
                        cartController.cartList[index].category.toString()
                        : cartController.cartList[index].arCategory.toString(),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: textStyleForSmallBlackText,
                      ),
                    ),
                  ),
                  Text(
                    Constant.isEnglish() ?
                    cartController.cartList[index].title.toString()
                    : cartController.cartList[index].arTitle.toString(),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    style: textStyleForListTitle,
                  ),
                  Text(
                    Constant.numberFormat(
                        cartController.cartList[index].price.toString()),
                    style: textStyleForNormalColorText,
                  ),
                ],
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    cartController.getCartItemDetails(index);
                    Get.toNamed('/cartDesignInfo');
                  },
                  child: Container(
                      padding: const EdgeInsets.all(7),
                      color: Colors.transparent,
                      child: const CustomSvgImage(
                        width: 20,
                        height: 20,
                        image: EDIT_ICON,
                      )),
                ),
                const SizedBox(height: 10),
                GestureDetector(
                  onTap: () async {
                    await cartController.removeDesignFromCartRequest(
                        context, index);
                  },
                  child: Container(
                      padding: const EdgeInsets.all(7),
                      color: Colors.transparent,
                      child: (cartController.loadingRemove.value &&
                              cartController.cartIndexDelete.value == index)
                          ? Container(
                              width: 20,
                              height: 20,
                              child: Center(
                                  child: CircularProgressIndicator(
                                      color: primaryColor)))
                          : const CustomSvgImage(
                              width: 20,
                              height: 20,
                              image: DELETE,
                            )),
                ),
              ],
            ),
          ],
        ),
      );
    });
  }
}
