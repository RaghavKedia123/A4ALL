import 'package:divyam_flutter/core/network/network_info.dart';
import 'package:divyam_flutter/features/authentication/data/data_sources/auth_remote_data_sources.dart';
import 'package:divyam_flutter/features/authentication/data/repository/auth_repository_impl.dart';
import 'package:divyam_flutter/features/authentication/domain/repository/auth_repository.dart';
import 'package:divyam_flutter/features/authentication/domain/usecases/forgot_password_otp_use_case.dart';
import 'package:divyam_flutter/features/authentication/domain/usecases/forgot_password_use_case.dart';
import 'package:divyam_flutter/features/authentication/domain/usecases/generate_otp_use_case.dart';
import 'package:divyam_flutter/features/authentication/domain/usecases/register_user_use_case.dart';
import 'package:divyam_flutter/features/authentication/domain/usecases/reset_password_use_case.dart';
import 'package:divyam_flutter/features/authentication/domain/usecases/signin_use_case.dart';
import 'package:divyam_flutter/features/authentication/presentation/blocs/auth_bloc/auth_cubit.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/data/datasources/remote/business_directory_remote_data_sources.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/data/repository/business_directory_repository_impl.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/domain/repository/business_directory_repository.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/domain/usecases/get_states_use_case.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/presentation/cubits/state_selector_cubit/state_selector_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

final sl = GetIt.instance;

Future<void> init() async {
  general();
  auth();
  businessDirectory();
}

void general() {
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));
}

void businessDirectory() {
  sl.registerLazySingleton<BusinessDirectoryRepository>(
      () => BusinessDirectoryRepositoryImpl(
            businessDirectoryRemoteDataSources: sl(),
            networkInfo: sl(),
          ));
  sl.registerLazySingleton<GetStatesUseCase>(
      () => GetStatesUseCase(businessDirectoryRepository: sl()));
  sl.registerLazySingleton(() => StateSelectorCubit(getStatesUseCase: sl()));
  sl.registerLazySingleton(() => BusinessDirectoryRemoteDataSources());
}

void auth() {
  sl.registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(networkInfo: sl(), repo: sl()));
  sl.registerLazySingleton<AuthRemoteDataSources>(
      () => AuthRemoteDataSources());
  sl.registerLazySingleton(() => GenerateOtpUse(authRepository: sl()));
  sl.registerLazySingleton(() => SignInUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => ForgotPasswordUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => RegisterUserUseCase(authRepository: sl()));
  sl.registerLazySingleton(() => ResetPasswordUseCase(authRepository: sl()));
  sl.registerLazySingleton(
      () => ForgotPasswordOtpUseCase(authRepository: sl()));
  sl.registerLazySingleton(
    () => AuthBloc(
      generateOtpUse: sl(),
      signInUseCase: sl(),
      forgotPasswordUseCase: sl(),
      registerUserUseCase: sl(),
      forgotPasswordOtpUseCase: sl(),
      resetPasswordUseCase: sl(),
    ),
  );
}
