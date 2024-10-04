import 'dart:convert';

import 'package:divyam_flutter/core/api/custom_client.dart';
import 'package:divyam_flutter/core/constants/url_constants.dart';
import 'package:divyam_flutter/core/error/exception.dart';
import 'package:divyam_flutter/core/response/api_base_response.dart';
import 'package:divyam_flutter/features/authentication/data/model/forgot_password.dart';
import 'package:divyam_flutter/features/authentication/data/model/otp_model.dart';
import 'package:divyam_flutter/features/authentication/data/model/register_model.dart';
import 'package:divyam_flutter/features/authentication/data/model/user_model.dart';
import 'package:divyam_flutter/features/authentication/domain/entity/forgot_password_entity.dart';
import 'package:divyam_flutter/features/authentication/domain/entity/forgot_password_otp_entity.dart';
import 'package:divyam_flutter/features/authentication/domain/entity/generate_otp_entity.dart';
import 'package:divyam_flutter/features/authentication/domain/entity/password_reset_entity.dart';
import 'package:divyam_flutter/features/authentication/domain/entity/register_user_entity.dart';
import 'package:divyam_flutter/features/authentication/domain/entity/sign_in_entity.dart';

class AuthRemoteDataSources {
  final CustomHttpClient _client = CustomHttpClient();

  Future<ApiBaseResponse<OtpModel>> generateOTP(
      {required GenerateOtpEntity entity}) async {
    try {
      final res =
          await _client.post(bodyData: entity.toJson(), url: GENRATE_OTP_URL);

      final decoded = jsonDecode(res.body);

      if (decoded['success'] == false) {
        throw ApiException(message: decoded['message']);
      } else {
        return ApiBaseResponse.fromJson(
            decoded,
            (json) =>
                OtpModel.fromJson((json as Map<String, dynamic>)['data']));
      }
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  Future<ApiBaseResponse<UserModel>> login(
      {required SignInEntity entity}) async {
    try {
      final response =
          await _client.post(bodyData: entity.toJson(), url: SIGN_IN_URL);
      final decoded = jsonDecode(response.body);
      if (decoded['success'] == false) {
        throw ApiException(message: decoded['message']);
      } else {
        return ApiBaseResponse.fromJson(
            decoded,
            (json) =>
                UserModel.fromJson((json as Map<String, dynamic>)['data']));
      }
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  Future<ApiBaseResponse<RegisterModel>> register(
      {required RegisterUserEntity entity}) async {
    try {
      final response =
          await _client.post(bodyData: entity.toJson(), url: REGISTER_URL);
      final decoded = jsonDecode(response.body);
      if (decoded['success'] == false) {
        throw ApiException(message: decoded['message']);
      } else {
        return ApiBaseResponse.fromJson(
            decoded,
            (json) =>
                RegisterModel.fromJson((json as Map<String, dynamic>)['data']));
      }
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  Future<ApiBaseResponse<ForgotPasswordModel>> forgotPassword(
      {required ForgotPasswordEntity entity}) async {
    try {
      final response = await _client.post(
          bodyData: entity.toJson(), url: FORGOT_PASSWORD_URL);
      final decoded = jsonDecode(response.body);
      if (decoded['success'] == false) {
        throw ApiException(message: decoded['message']);
      } else {
        return ApiBaseResponse.fromJson(
            decoded,
            (json) => ForgotPasswordModel.fromJson(
                (json as Map<String, dynamic>)['data']));
      }
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  Future<ApiBaseResponse<OtpModelForgotPassword>> forgotPasswordSendOtp(
      {required ForgotPasswordOtpEntity entity}) async {
    try {
      final response = await _client.post(
          bodyData: entity.toJson(), url: FORGOT_PASSWORD_SENDOTP_URL);
      final decoded = jsonDecode(response.body);
      if (decoded['success'] == false) {
        throw ApiException(message: decoded['message']);
      } else {
        return ApiBaseResponse.fromJson(
            decoded,
            (json) => OtpModelForgotPassword.fromJson(
                (json as Map<String, dynamic>)['data']));
      }
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }

  Future<ApiBaseResponseNoData> resetPassword(
      {required PasswordResetEntity entity}) async {
    try {
      final response = await _client.post(
          bodyData: entity.toJson(), url: PASSWORD_UPDATE_URL);
      final decoded = jsonDecode(response.body);
      if (decoded['success'] == false) {
        throw ApiException(message: decoded['message']);
      } else {
        return ApiBaseResponseNoData.fromJson(jsonDecode(response.body));
      }
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}
