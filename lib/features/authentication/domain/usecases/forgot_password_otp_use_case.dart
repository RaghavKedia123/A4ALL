import 'package:dartz/dartz.dart';
import 'package:divyam_flutter/core/error/failure.dart';
import 'package:divyam_flutter/core/response/api_base_response.dart';
import 'package:divyam_flutter/core/usecase/use_case.dart';
import 'package:divyam_flutter/features/authentication/data/model/otp_model.dart';
import 'package:divyam_flutter/features/authentication/domain/entity/forgot_password_otp_entity.dart';
import 'package:divyam_flutter/features/authentication/domain/repository/auth_repository.dart';

class ForgotPasswordOtpUseCase
    implements
        UseCase<ApiBaseResponse<OtpModelForgotPassword>,
            ForgotPasswordOtpEntity> {
  final AuthRepository _authRepository;

  const ForgotPasswordOtpUseCase({required AuthRepository authRepository})
      : _authRepository = authRepository;

  @override
  Future<Either<Failure, ApiBaseResponse<OtpModelForgotPassword>>> call(
      ForgotPasswordOtpEntity entity) {
    return _authRepository.forgotPasswordSendOtp(entity: entity);
  }
}
