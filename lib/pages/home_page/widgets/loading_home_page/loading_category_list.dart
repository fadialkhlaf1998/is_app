import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/res/styles.dart';
import 'package:is_app/widgets/loading/circle_loading_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingCategoriesList extends StatelessWidget {
  const LoadingCategoriesList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: const ValueKey('123'),
      width: Get.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              context.localizations.categories,
              style: textStyleForTitle,
            ),
          ),
          SizedBox(
            height: Get.height * 0.13,
            child: ListView.builder(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount: 7,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, index) {
                return const Column(
                  children: [
                    CircleLoadingContainer(
                      width: 0.15,
                      height: 0.13,
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
