// ignore_for_file: deprecated_member_use

import 'package:is_app/data/constants/api_constants.dart';
import 'package:is_app/data/dio/api_response.dart';
import 'package:is_app/data/dio/app_exception.dart';
import 'package:dio/dio.dart';
import 'dio_interceptors.dart';

class DioClient {
  final dio = Dio()..interceptors.add(DioInterceptors());

  Future<ApiResponse> getRequest(
    String apiUrl, {
    Map<String, dynamic>? queryParameters,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await dio.get(baseUrl + apiUrl,
          queryParameters: queryParameters, options: options);
      // print('##############');
      // print(response.data);
      // print('##############');
      return ApiResponse.fromJson(response.data);
    } on DioError catch (e) {
      print(e);
      throw ServerException(message: e.response!.data);
    }
  }

  Future<ApiResponse> postRequest(
    String apiUrl, {
    data,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response =
          await dio.post(baseUrl + apiUrl, data: data, options: options);
      return ApiResponse.fromJson(response.data);
    } on DioError catch (e) {
      return ApiResponse.fromJson(e.response!.data);
    }
  }

  Future<ApiResponse> putRequest(
    String apiUrl, {
    Object? data,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response response =
          await dio.put(baseUrl + apiUrl, data: data, options: options);
      return ApiResponse.fromJson(response.data);
    } on DioError catch (e) {
      return ApiResponse.fromJson(e.response?.data);
    }
  }

  Future<ApiResponse> deleteRequest(
    String apiUrl, {
    data,
    CancelToken? cancelToken,
    Options? options,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      Response response =
          await dio.delete(baseUrl + apiUrl, data: data, options: options);
      return ApiResponse.fromJson(response.data);
    } on DioError catch (e) {
      return ApiResponse.fromJson(e.response?.data);
    }
  }
}
