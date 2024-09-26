import 'package:is_app/controller/constant.dart';
import 'package:is_app/data/models/body/guest/search_body.dart';
import 'package:is_app/data/models/response/guest/search_response.dart';
import 'package:is_app/data/repository/guest_repo.dart';
import 'package:is_app/extensions/context_localization.dart';
import 'package:is_app/widgets/snack_bar/top_snack_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SearchMainPageController extends GetxController {
  TextEditingController searchTextController = TextEditingController();

  GuestRepo guestRepo = GuestRepo();

  RxBool loading = false.obs;
  RxList<SearchResponse> searchResultList = <SearchResponse>[].obs;

  searchRequest(BuildContext context) async {
    if (loading.isFalse && searchTextController.text.isNotEmpty) {
      searchResultList.clear();
      Constant.closeKeyBoard();
      loading.value = true;
      guestRepo
          .search(SearchBody(query: searchTextController.text))
          .then((value) {
        if (value.code == 1) {
          searchResultList.addAll((value.data['suggestion_list'] as List)
              .map((e) => SearchResponse.fromJson(e))
              .toList());
          loading.value = false;
        } else {
          loading.value = false;
          TopSnackBar.warning(context, context.localizations.something_wrong);
        }
      });
    }
  }

  clearSearch() {
    Constant.closeKeyBoard();
    searchTextController.clear();
    searchResultList.clear();
  }
}
