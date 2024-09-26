import 'package:is_app/controller/init_controller.dart';
import 'package:is_app/data/constants/api_constants.dart';
import 'package:is_app/pages/home_page/controller.dart';
import 'package:is_app/res/color.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeSlider extends StatelessWidget {
  HomeSlider({Key? key}) : super(key: key);
  final HomeController homeController = Get.find();
  final InitController initController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
        key: const ValueKey('222'),
        child: Obx(() {
          return Column(
            children: [
              Container(
                width: Get.width,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: Get.height * 0.23,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.85,
                    initialPage: 0,
                    enableInfiniteScroll:
                        initController.bannersList.length == 2 ? false : true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 10),
                    autoPlayAnimationDuration: const Duration(milliseconds: 1500),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.15,
                    scrollDirection: Axis.horizontal,
                    onPageChanged: (index, reason) {
                      homeController.currentSliderIndex.value = index;
                    },
                  ),
                  items: initController.bannersList.map((i) {
                    return Builder(
                      builder: (BuildContext context) {
                        return Container(
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.transparent,
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                              '$baseUrl/uploads/${i.image}',
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
                                      value: loadingProgress.expectedTotalBytes !=
                                              null
                                          ? loadingProgress
                                                  .cumulativeBytesLoaded /
                                              loadingProgress.expectedTotalBytes!
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
              ),
              const SizedBox(
                height: 10,
              ),
              AnimatedSmoothIndicator(
                activeIndex: homeController.currentSliderIndex.value,
                count: initController.bannersList.length,
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
          );
        }));
  }
}
