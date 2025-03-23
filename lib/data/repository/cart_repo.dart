import 'package:is_app/controller/init_controller.dart';
import 'package:is_app/data/constants/api_constants.dart';
import 'package:is_app/data/dio/api_response.dart';
import 'package:is_app/data/dio/dio_client.dart';
import 'package:is_app/data/models/body/cart/cart_body.dart';
import 'package:is_app/data/models/body/cart/cart_id_body.dart';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

class CartRepo {
  DioClient dioClient = DioClient();
  final InitController initController = Get.find();

  Future<ApiResponse> addToCart(CartBody cartBody) async {
    return await dioClient.postRequest(
      ADD_TO_CART,
      data: cartBody.toFormData(),
      options: Options(headers: {
        "Authorization": "bearer ${initController.userData.token}"
      }),
    );
  }

  Future<ApiResponse> getCart() async {
    return await dioClient.getRequest(
      GET_CART,
      options: Options(headers: {
        "Authorization": "bearer ${initController.userData.token}"
      }),
    );
  }

  Future<ApiResponse> editCart(CartBody cartBody) async {
    return await dioClient.putRequest(
      EDIT_CART,
      data: cartBody.toFormData(),
      options: Options(headers: {
        "Authorization": "bearer ${initController.userData.token}"
      }),
    );
  }

  Future<ApiResponse> deleteFromCart(CartIdBody cartIdBody) async {
    return await dioClient.deleteRequest(
      DELETE_CART,
      data: cartIdBody.toJson(),
      options: Options(headers: {
        "Authorization": "bearer ${initController.userData.token}"
      }),
    );
  }

  Future<ApiResponse> checkout(String paymentMethod,String? referance_id) async {
    return await dioClient.postRequest(
      CHECKOUT,
      data: {
        "payment_method":paymentMethod,
        "referance_id":referance_id == null?"":referance_id
      },
      options: Options(headers: {
        "Authorization": "bearer ${initController.userData.token}"
      }),
    );
  }
}
