import 'package:get/get.dart';

class HomeController extends GetxController {
  RxInt currentSliderIndex = 0.obs;

  RxInt selectCategoryId = 0.obs;
  RxInt selectStylesId = 0.obs;
  RxString selectCategoryName = ''.obs;
  RxString selectStylesName = ''.obs;

  RxInt selectDesignId = 0.obs;
}
