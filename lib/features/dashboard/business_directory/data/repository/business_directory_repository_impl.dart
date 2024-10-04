import 'package:dartz/dartz.dart';
import 'package:divyam_flutter/core/error/failure.dart';
import 'package:divyam_flutter/core/network/network_info.dart';
import 'package:divyam_flutter/core/response/api_base_response.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/data/datasources/remote/business_directory_remote_data_sources.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/data/model/state_model.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/domain/repository/business_directory_repository.dart';

class BusinessDirectoryRepositoryImpl implements BusinessDirectoryRepository {
  final BusinessDirectoryRemoteDataSources _businessDirectoryRemoteDataSources;

  final NetworkInfo _networkInfo;

  BusinessDirectoryRepositoryImpl(
      {required BusinessDirectoryRemoteDataSources
          businessDirectoryRemoteDataSources,
      required NetworkInfo networkInfo})
      : _businessDirectoryRemoteDataSources =
            businessDirectoryRemoteDataSources,
        _networkInfo = networkInfo;
  @override
  Future<Either<Failure, ApiBaseResponse<List<StateModel>>>>
      fetchAllTheStates() async {
    if (await _networkInfo.isConnected) {
      final res = await _businessDirectoryRemoteDataSources.fetchAllTheStates();
      return Right(res);
    } else {
      return Left(InternetFailure());
    }
  }
}
