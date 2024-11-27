import 'package:is_app/data/models/response/guest/gallery_response.dart';
import 'package:is_app/data/repository/guest_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GalleryController extends GetxController {
  GuestRepo guestRepo = GuestRepo();
  RxList<GalleryResponse> galleryList = <GalleryResponse>[].obs;
  RxBool loading = false.obs;

  final ScrollController scrollController = ScrollController();
  final PageController pageController = PageController();
  RxInt currentIndex = 0.obs;

  getGalleryImageRequest() async {
    loading.value = true;
    galleryList.clear();
    await guestRepo.getGallery().then((value) {
      if (value.code == 1) {
        galleryList.addAll((value.data['gallery'] as List)
            .map((e) => GalleryResponse.fromJson(e))
            .toList());
        loading.value = false;
      } else {
        loading.value = false;
      }
    });
  }


  void scrollToIndex(int index) {
    Future.delayed(Duration(milliseconds: 300), () {
      scrollController.animateTo(
        (index ~/ 3) * 100.0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.fastOutSlowIn,
      );
    });
  }

  @override
  void onInit() {
    super.onInit();
    getGalleryImageRequest();
  }
}
