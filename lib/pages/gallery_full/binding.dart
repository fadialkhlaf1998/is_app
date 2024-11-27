import 'package:get/get.dart';
import 'package:is_app/pages/gallery_full/controller.dart';

class GalleryFullBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(GalleryFullController());
  }
}
