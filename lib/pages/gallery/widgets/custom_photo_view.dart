import 'package:is_app/data/constants/api_constants.dart';
import 'package:is_app/pages/gallery/controller.dart';
import 'package:is_app/res/color.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:photo_view/photo_view.dart';

class CustomPhotoViewPage extends StatelessWidget {
  CustomPhotoViewPage({Key? key}) : super(key: key);

  final GalleryController galleryController = Get.find();

  final int index = Get.arguments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: white,
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
        child: Center(
          child: Hero(
            tag: 'gallery_image $index',
            child: SizedBox(
              child: PhotoView(
                enableRotation: false,
                backgroundDecoration: BoxDecoration(color: white),
                imageProvider: NetworkImage(
                    '$baseUrl/uploads/${galleryController.galleryList[index].image}'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
