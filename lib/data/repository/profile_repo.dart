import 'package:is_app/controller/init_controller.dart';
import 'package:is_app/data/constants/api_constants.dart';
import 'package:is_app/data/dio/api_response.dart';
import 'package:is_app/data/dio/dio_client.dart';
import 'package:is_app/data/models/body/profile/change_password_body.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ProfileRepo {
  DioClient dioClient = DioClient();
  final InitController initController = Get.find();

  Future<ApiResponse> changePassword(
      ChangePasswordBody changePasswordBody) async {
    return await dioClient.putRequest(
      CHANGE_PASSWORD,
      data: changePasswordBody.toJson(),
      options: Options(headers: {
        "Authorization": "bearer ${initController.userData.token}"
      }),
    );
  }

  Future<ApiResponse> deleteAccount() async {
    return await dioClient.deleteRequest(
      DELETE_ACCOUNT,
      options: Options(headers: {
        "Authorization": "bearer ${initController.userData.token}"
      }),
    );
  }

  Future<ApiResponse> getOrderHistory() async {
    return await dioClient.getRequest(
      ORDER_HISTORY,
      options: Options(headers: {
        "Authorization": "bearer ${initController.userData.token}"
      }),
    );
  }

  Future<ApiResponse> getOrderDetails(String id) async {
    return await dioClient.getRequest(
      ORDER_DETAILS + id,
      options: Options(headers: {
        "Authorization": "bearer ${initController.userData.token}"
      }),
    );
  }
}
