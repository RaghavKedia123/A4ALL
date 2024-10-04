import 'dart:convert';

import 'package:divyam_flutter/core/api/custom_client.dart';
import 'package:divyam_flutter/core/constants/url_constants.dart';
import 'package:divyam_flutter/core/error/exception.dart';
import 'package:divyam_flutter/core/response/api_base_response.dart';
import 'package:divyam_flutter/features/dashboard/business_directory/data/model/state_model.dart';

class BusinessDirectoryRemoteDataSources {
  final CustomHttpClient _client = CustomHttpClient();

  Future<ApiBaseResponse<List<StateModel>>> fetchAllTheStates() async {
    try {
      final response = await _client.get(url: GET_ALL_STATES_URL);
      final decoded = jsonDecode(response.body);
      if (decoded['success'] == false) {
        throw ApiException(message: decoded['message']);
      } else {
        return ApiBaseResponse.fromJson(
            decoded,
            (json) => ((json as Map)['data'] as List)
                .map((e) => StateModel.fromJson(e as Map<String, dynamic>))
                .toList());
      }
    } catch (e) {
      throw ApiException(message: e.toString());
    }
  }
}
