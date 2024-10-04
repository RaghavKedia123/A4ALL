import 'package:dartz/dartz.dart';
import 'package:divyam_flutter/core/error/failure.dart';
import 'package:divyam_flutter/core/response/api_base_response.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/data/model/state_model.dart';

abstract class BusinessDirectoryRepository {
  Future<Either<Failure, ApiBaseResponse<List<StateModel>>>>
      fetchAllTheStates();
}
