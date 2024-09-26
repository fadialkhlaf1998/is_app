import 'package:is_app/data/constants/api_constants.dart';
import 'package:is_app/data/dio/api_response.dart';
import 'package:is_app/data/dio/dio_client.dart';
import 'package:is_app/data/models/body/auth/login_body.dart';
import 'package:is_app/data/models/body/auth/sign_up_body.dart';

class AuthRepo {
  DioClient dioClient = DioClient();

  Future<ApiResponse> login(LoginBody loginBody) async {
    return await dioClient.postRequest(LOGIN, data: loginBody.toJson());
  }

  Future<ApiResponse> signUp(SignUpBody signUpBody) async {
    return await dioClient.postRequest(SIGNUP, data: signUpBody.toJson());
  }
}
