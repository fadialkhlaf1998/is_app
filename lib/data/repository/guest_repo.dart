import 'package:is_app/data/constants/api_constants.dart';
import 'package:is_app/data/dio/api_response.dart';
import 'package:is_app/data/dio/dio_client.dart';
import 'package:is_app/data/models/body/guest/filter_body.dart';
import 'package:is_app/data/models/body/guest/search_body.dart';

class GuestRepo {
  final DioClient dioClient = DioClient();

  Future<ApiResponse> getHomePageData() async {
    return await dioClient.getRequest(HOME_PAGE);
  }

  Future<ApiResponse> getGallery() async {
    return await dioClient.getRequest(GALLERY);
  }

  Future<ApiResponse> getDesignDetails(id) async {
    return await dioClient.getRequest(DESIGN_DETAILS + id);
  }

  Future<ApiResponse> filter(FilterBody filterBody) async {
    return await dioClient.postRequest(FILTER, data: filterBody.toJson());
  }

  Future<ApiResponse> search(SearchBody searchBody) async {
    return await dioClient.postRequest(SEARCH, data: searchBody.toJson());
  }
}
