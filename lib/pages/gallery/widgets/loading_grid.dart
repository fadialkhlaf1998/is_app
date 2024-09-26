import 'package:is_app/widgets/loading/loading_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class GalleryLoadingGrid extends StatelessWidget {
  const GalleryLoadingGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      key: const ValueKey('212'),
      width: Get.width * 0.95,
      child: GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 2,
          mainAxisSpacing: 7,
          crossAxisSpacing: 0,
          pattern: [
            const QuiltedGridTile(2, 1),
            const QuiltedGridTile(1, 1),
            const QuiltedGridTile(1, 1),
            const QuiltedGridTile(1, 2),
          ],
        ),
        itemCount: 8,
        itemBuilder: (BuildContext context, index) {
          return Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(5),
            ),
            child: const LoadingContainer(
              height: 100,
              width: 150,
            ),
          );
        },
      ),
    );
  }
}
