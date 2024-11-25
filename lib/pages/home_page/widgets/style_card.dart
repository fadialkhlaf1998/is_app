import 'package:is_app/controller/constant.dart';
import 'package:is_app/controller/init_controller.dart';
import 'package:is_app/data/constants/api_constants.dart';
import 'package:is_app/pages/home_page/controller.dart';
import 'package:is_app/res/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StyleCard extends StatelessWidget {
  final int index;
  StyleCard({required this.index, Key? key}) : super(key: key);
  final InitController initController = Get.find();
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        homeController.selectStylesId.value =
            initController.stylesList[index].styleId ?? 0;
        if (Constant.isEnglish()) {
          homeController.selectStylesName.value =
              initController.stylesList[index].title ?? '';
        } else {
          homeController.selectStylesName.value =
              initController.stylesList[index].arTitle ?? '';
        }
        Get.toNamed('/stylesDetails');
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: Get.width * 0.47,
              height: Get.width * 0.34,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(Constant.border),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  '$baseUrl/uploads/${initController.stylesList[index].image}',
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
            Expanded(
              child: Container(
                width: Get.width * 0.45,
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(Constant.isEnglish()
                        ? initController.stylesList[index].title.toString()
                        : initController.stylesList[index].arTitle.toString()),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text('${initController.stylesList[index].price} SAR'),
                    //   ],
                    // ),
                    // SizedBox(
                    //   height: Get.height * 0.04,
                    //   child: ListView.builder(
                    //     scrollDirection: Axis.horizontal,
                    //     itemCount: 3,
                    //     itemBuilder: (BuildContext context, index) {
                    //       return Container(
                    //         height: Get.height * 0.04,
                    //         width: Get.height * 0.04,
                    //         margin: const EdgeInsets.only(right: 10),
                    //         decoration: const BoxDecoration(
                    //             color: Colors.red, shape: BoxShape.circle),
                    //       );
                    //     },
                    //   ),
                    // )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
