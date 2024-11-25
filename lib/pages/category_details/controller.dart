import 'package:is_app/controller/init_controller.dart';
import 'package:is_app/data/models/body/guest/filter_body.dart';
import 'package:is_app/data/models/response/guest/design_details_response.dart';
import 'package:is_app/data/repository/guest_repo.dart';
import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/pages/home_page/controller.dart';
import 'package:is_app/widgets/snack_bar/top_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CategoryDetailsController extends GetxController {
  RxBool filterOpenMenu = false.obs;

  GuestRepo guestRepo = GuestRepo();

  final HomeController homeController = Get.find();

  RxList<DesignResponse> categoryDesignsList = <DesignResponse>[].obs;
  RxList<DesignResponse> categoryDesignsFilterList = <DesignResponse>[].obs;

  TextEditingController searchTextController = TextEditingController();
  final InitController initController = Get.find();

  RxBool loading = false.obs;

  RxList<int> chosenCategoryList = <int>[].obs;
  RxList<int> chosenStyleList = <int>[].obs;
  RxList<int> chosenMoodboardList = <int>[].obs;

  List<int> tempList = [];

  getDesignForCategory() async {
    loading.value = true;
    categoryDesignsList.clear();
    categoryDesignsFilterList.clear();
    chosenCategoryList.clear();

    await guestRepo
        .filter(
            FilterBody(categoryList: [homeController.selectCategoryId.value]))
        .then((value) {
      if (value.code == 1) {
        categoryDesignsList.addAll((value.data['designs'] as List)
            .map((e) => DesignResponse.fromJson(e))
            .toList());
        categoryDesignsFilterList.addAll((value.data['designs'] as List)
            .map((e) => DesignResponse.fromJson(e))
            .toList());

        tempList = value.data['current_filter']['category_list'].cast<int>();
        chosenCategoryList.addAll(tempList);

        loading.value = false;
      } else {
        loading.value = false;
        print('something wrong');
      }
    });
  }

  clearFilter() {
    if (filterOpenMenu.value) {
      filterOpenMenu.value = false;
    } else {
      Get.back();
    }
  }

  @override
  void onInit() {
    getDesignForCategory();
    super.onInit();
  }

  void filterItemsBySearch(String query) {
    if (query.isEmpty) {
      categoryDesignsFilterList.clear();
      categoryDesignsFilterList.addAll(categoryDesignsList);
    } else {
      categoryDesignsFilterList.value = categoryDesignsList
          .where((item) =>
              item.title!.toLowerCase().contains(query.toLowerCase()) ||
              item.arTitle!.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }

  clearSearch() {
    searchTextController.clear();
    categoryDesignsFilterList.clear();
    categoryDesignsFilterList.addAll(categoryDesignsList);
    chosenCategoryList.clear();
    chosenCategoryList.addAll(tempList);
    chosenStyleList.clear();
    chosenMoodboardList.clear();
  }

  checkCategorySelect(i) {
    return chosenCategoryList
        .contains(initController.categoriesList[i].categoryId);
  }

  checkStyleSelect(i) {
    return chosenStyleList.contains(initController.stylesList[i].styleId);
  }

  checkMoodboardSelect(i) {
    return chosenMoodboardList
        .contains(initController.moodboardsList[i].moodboardId);
  }

  addOrRemoveFilterCategory(index) {
    int categoryId = initController.categoriesList[index].categoryId!;
    if (chosenCategoryList.contains(categoryId)) {
      print('remove =======>');
      chosenCategoryList.remove(categoryId);
    } else {
      print('add =======>');
      chosenCategoryList.add(categoryId);
    }
  }

  addOrRemoveFilterStyle(index) {
    int styleId = initController.stylesList[index].styleId!;
    if (chosenStyleList.contains(styleId)) {
      print('remove =======>');
      chosenStyleList.remove(styleId);
    } else {
      print('add =======>');
      chosenStyleList.add(styleId);
    }
  }

  addOrRemoveFilterMoodboard(index) {
    int moodboardId = initController.moodboardsList[index].moodboardId!;
    if (chosenMoodboardList.contains(moodboardId)) {
      print('remove =======>');
      chosenMoodboardList.remove(moodboardId);
    } else {
      print('add =======>');
      chosenMoodboardList.add(moodboardId);
    }
  }

  applyFilterRequest(BuildContext context) {
    guestRepo
        .filter(FilterBody(
            categoryList: chosenCategoryList,
            styleList: chosenStyleList,
            moodboardList: chosenMoodboardList))
        .then((value) {
      if (value.code == 1) {
        categoryDesignsFilterList.clear();
        categoryDesignsFilterList.addAll((value.data['designs'] as List)
            .map((e) => DesignResponse.fromJson(e))
            .toList());
        filterOpenMenu.value = false;
      } else {
        TopSnackBar.warning(context, context.localizations.something_wrong);
      }
    });
  }
}
