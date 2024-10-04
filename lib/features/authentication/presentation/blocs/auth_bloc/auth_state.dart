part of 'auth_cubit.dart';

sealed class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthSuccessState extends AuthState {
  final String message;
  const AuthSuccessState({required this.message});
}

class AuthFailureState extends AuthState {
  final String errorMessage;
  const AuthFailureState({required this.errorMessage});
}

class LoginSuccessState extends AuthState {
  final ApiBaseResponse<UserModel> response;
  const LoginSuccessState({required this.response});
}

class ForgotPasswordSuccessState extends AuthState {
  final ApiBaseResponse<ForgotPasswordModel> response;
  const ForgotPasswordSuccessState({required this.response});
}

class RegisterUserSuccessState extends AuthState {
  final ApiBaseResponse<RegisterModel> response;
  const RegisterUserSuccessState({required this.response});
}
