import 'package:is_app/controller/constant.dart';
import 'package:is_app/data/constants/api_constants.dart';
import 'package:is_app/pages/home_page/controller.dart';
import 'package:is_app/pages/search/controller.dart';
import 'package:is_app/res/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchResultCard extends StatelessWidget {
  final int index;
  SearchResultCard({required this.index, Key? key}) : super(key: key);
  final SearchMainPageController searchMainPageController = Get.find();
  final HomeController homeController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return GestureDetector(
        onTap: () {
          homeController.selectDesignId.value =
              searchMainPageController.searchResultList[index].designId ?? 0;
          Get.toNamed('/designDetails');
        },
        child: Container(
          color: Colors.transparent,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: Get.width * 0.47,
                height: Get.width * 0.37,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(Constant.border),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    '$baseUrl/uploads/${searchMainPageController.searchResultList[index].images!.split(',')[0]}',
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
                      Text(
                        Constant.isEnglish()
                            ? searchMainPageController
                                .searchResultList[index].title
                                .toString()
                            : searchMainPageController
                                .searchResultList[index].arTitle
                                .toString(),
                        maxLines: 1,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
