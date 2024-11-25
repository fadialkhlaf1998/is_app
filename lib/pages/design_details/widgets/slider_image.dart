import 'package:is_app/data/constants/api_constants.dart';
import 'package:is_app/pages/design_details/controller.dart';
import 'package:is_app/res/color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:is_app/res/images.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class DesignSliderImage extends StatelessWidget {
  DesignSliderImage({Key? key}) : super(key: key);
  final DesignDetailsController designDetailsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return SizedBox(
          width: Get.width,
          child: Column(
            children: [
              designDetailsController.selectDesignDetails.allImages!.isEmpty ||
                      designDetailsController.selectDesignDetails.allImages ==
                          null
                  ? Image.asset(NO_IMAGE)
                  : CarouselSlider(
                      carouselController:
                          designDetailsController.carouselSliderController,
                      options: CarouselOptions(
                        height: Get.height * 0.45,
                        aspectRatio: 16 / 9,
                        viewportFraction: 1,
                        initialPage: 0,
                        enableInfiniteScroll:
                            designDetailsController.designImages.length == 2
                                ? false
                                : true,
                        reverse: false,
                        autoPlay: false,
                        autoPlayInterval: const Duration(seconds: 10),
                        autoPlayAnimationDuration:
                            const Duration(milliseconds: 1500),
                        autoPlayCurve: Curves.fastOutSlowIn,
                        enlargeCenterPage: true,
                        enlargeFactor: 0.4,
                        scrollDirection: Axis.horizontal,
                        onPageChanged: (index, reason) {
                          designDetailsController
                              .currentImageSliderIndex.value = index;
                        },
                      ),
                      items: designDetailsController.designImages.map((i) {
                        return Builder(
                          builder: (BuildContext context) {
                            return Container(
                              width: MediaQuery.of(context).size.width,
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.transparent,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: Image.network(
                                  '$baseUrl/uploads/$i',
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
                            );
                          },
                        );
                      }).toList(),
                    ),
              const SizedBox(
                height: 10,
              ),
              AnimatedSmoothIndicator(
                activeIndex:
                    designDetailsController.currentImageSliderIndex.value,
                count: designDetailsController.designImages.length,
                duration: const Duration(milliseconds: 800),
                curve: Curves.fastOutSlowIn,
                effect: ExpandingDotsEffect(
                    dotColor: grey,
                    activeDotColor: primaryColor,
                    dotHeight: 10,
                    dotWidth: 10,
                    expansionFactor: 3),
              )
            ],
          ));
    });
  }
}
