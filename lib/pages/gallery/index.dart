import 'package:is_app/data/constants/api_constants.dart';
import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/gallery/controller.dart';
import 'package:is_app/pages/gallery/widgets/loading_grid.dart';
import 'package:is_app/res/color.dart';
import 'package:is_app/res/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';

class GalleryPage extends StatelessWidget {
  GalleryPage({Key? key}) : super(key: key);
  final GalleryController galleryController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return RefreshIndicator(
        onRefresh: () async {
          await galleryController.getGalleryImageRequest();
        },
        color: primaryColor,
        child: Container(
          color: Colors.transparent,
          width: Get.width,
          child: Column(
            children: [
              Container(
                width: Get.width * 0.95,
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Text(
                  context.localizations.gallery,
                  style: textStyleForTitle,
                ),
              ),
              Expanded(
                  child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 500),
                      child: galleryController.loading.value
                          ? const GalleryLoadingGrid()
                          : _gallery()))
            ],
          ),
        ),
      );
    });
  }

  _gallery() {
    return Container(
      width: Get.width * 0.95,
      child: GridView.builder(
        physics:
            BouncingScrollPhysics().applyTo(AlwaysScrollableScrollPhysics()),
        controller: galleryController.scrollController,
        gridDelegate: SliverQuiltedGridDelegate(
          crossAxisCount: 2,
          mainAxisSpacing: 7,
          crossAxisSpacing: 7,
          pattern: [
            const QuiltedGridTile(2, 1),
            const QuiltedGridTile(1, 1),
            const QuiltedGridTile(1, 1),
            const QuiltedGridTile(1, 2),
          ],
        ),
        itemCount: galleryController.galleryList.length,
        itemBuilder: (BuildContext context, index) {
          return GestureDetector(
            onTap: () {
              Get.toNamed('/customPhotoView', arguments: index);
            },
            child: Hero(
              tag: 'gallery_image $index',
              child: Container(
                decoration: BoxDecoration(
                  color: grey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: Offset(0, 1),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                    '$baseUrl/uploads/${galleryController.galleryList[index].image}',
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
            ),
          );
        },
      ),
    );
  }
}
