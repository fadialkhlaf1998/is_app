import 'package:is_app/controller/init_controller.dart';
import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/home_page/widgets/style_card.dart';
import 'package:is_app/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeStylesGrid extends StatelessWidget {
  HomeStylesGrid({Key? key}) : super(key: key);
  final InitController initController = Get.find();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: const ValueKey('1234'),
      child: Obx(() {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.localizations.styles,
              style: textStyleForTitle,
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 10, top: 10),
              width: Get.width * 0.95,
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: initController.stylesList.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  // childAspectRatio: 5 / 7,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemBuilder: (BuildContext context, index) {
                  return StyleCard(index: index);
                },
              ),
            ),
          ],
        );
      }),
    );
  }
}
