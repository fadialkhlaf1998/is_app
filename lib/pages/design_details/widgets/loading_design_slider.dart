import 'package:is_app/widgets/loading/loading_container.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingDesignSlider extends StatelessWidget {
  const LoadingDesignSlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: const ValueKey('111'),
      padding: const EdgeInsets.only(bottom: 20),
      child: CarouselSlider(
        options: CarouselOptions(
          height: Get.height * 0.45,
          aspectRatio: 16 / 9,
          viewportFraction: 1,
          initialPage: 1,
          enableInfiniteScroll: false,
          scrollPhysics: const NeverScrollableScrollPhysics(),
          reverse: false,
          autoPlay: false,
          autoPlayInterval: const Duration(seconds: 10),
          autoPlayAnimationDuration: const Duration(milliseconds: 1500),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.15,
          scrollDirection: Axis.horizontal,
          onPageChanged: (index, reason) {},
        ),
        items: [1, 2, 3].map((i) {
          return Builder(
            builder: (BuildContext context) {
              return const LoadingContainer(width: 100, height: 100);
            },
          );
        }).toList(),
      ),
    );
  }
}
