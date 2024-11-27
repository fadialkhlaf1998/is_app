import 'package:flutter/material.dart';
import 'package:is_app/data/constants/api_constants.dart';
import 'package:is_app/pages/gallery/controller.dart';
import 'package:get/get.dart';
import 'package:is_app/res/color.dart';
import 'package:photo_view/photo_view.dart';

class GalleryFullPage extends StatelessWidget {

   GalleryFullPage({super.key});
   final GalleryController galleryController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
              color: Colors.transparent,
              child: Icon(Icons.arrow_back_ios_new_outlined, color: black)),
        ),
      ),
      body: SafeArea(
        child: PageView.builder(
          controller: PageController(initialPage: galleryController.currentIndex.value),
          onPageChanged: (index) {
            galleryController.currentIndex.value = index;
          },
          itemCount: galleryController.galleryList.length,
          itemBuilder: (BuildContext context, index){
            return Hero(
              tag: 'gallery_image $index',
              child: SizedBox(
                child: PhotoView(
                  enableRotation: false,
                  backgroundDecoration: BoxDecoration(color: white),
                  imageProvider: NetworkImage(
                      '$baseUrl/uploads/${galleryController.galleryList[index].image}'),
                  loadingBuilder: (context, event) {
                    return Center(
                      child: CircularProgressIndicator(
                        value: event == null
                            ? null
                            : event.cumulativeBytesLoaded / (event.expectedTotalBytes ?? 1),
                        valueColor: AlwaysStoppedAnimation<Color>(primaryColor), // Customize color
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
