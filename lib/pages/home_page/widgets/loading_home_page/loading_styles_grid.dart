import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/res/styles.dart';
import 'package:is_app/widgets/loading/loading_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoadingStylesGrid extends StatelessWidget {
  const LoadingStylesGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: const ValueKey('4321'),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.localizations.styles,
            style: textStyleForTitle,
          ),
          Container(
            padding: const EdgeInsets.only(bottom: 20, top: 10),
            width: Get.width * 0.95,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                // childAspectRatio: 5 / 7,
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 15,
              ),
              itemBuilder: (BuildContext context, index) {
                return const LoadingContainer(width: 0.47, height: 0.18);
              },
            ),
          ),
        ],
      ),
    );
  }
}
