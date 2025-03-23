import 'package:is_app/data/constants/api_constants.dart';
import 'package:is_app/data/dio/api_response.dart';
import 'package:is_app/data/dio/dio_client.dart';
import 'package:is_app/data/models/body/auth/forgot_password_body.dart';
import 'package:is_app/data/models/body/auth/login_body.dart';
import 'package:is_app/data/models/body/auth/sign_up_body.dart';
import 'package:is_app/data/models/body/auth/verification_code_body.dart';

class AuthRepo {
  DioClient dioClient = DioClient();

  Future<ApiResponse> login(LoginBody loginBody) async {
    return await dioClient.postRequest(LOGIN, data: loginBody.toJson());
  }

  Future<ApiResponse> forgotPassword(ForgotPasswordBody forgotPasswordBody) async {
    return await dioClient.postRequest(FORGOT_PASSWORD, data: forgotPasswordBody.toJson());
  }

  Future<ApiResponse> verificationCode(VerificationCodeBody verificationCodeBody) async {
    return await dioClient.putRequest(VERIFICATION_CODE, data: verificationCodeBody.toJson());
  }

  Future<ApiResponse> signUp(SignUpBody signUpBody) async {
    return await dioClient.postRequest(SIGNUP, data: signUpBody.toJson());
  }
}
