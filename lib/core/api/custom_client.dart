import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
// import 'package:divyam_flutter/core/constants/app_string.dart';
// import 'package:divyam_flutter/core/helpers/user_helpers.dart';

class CustomHttpClient {
  final client = http.Client();

  // var token = 'Bearer ${UserHelpers.getAuthToken()}';

  Future<http.Response> get(
      {required String url, Map<String, String>? headers}) async {
    var response = await client.get(
      Uri.parse(url),
    );
    return response;
  }

  Future<http.Response> post({
    Map<String, String>? headers,
    required var bodyData,
    required String url,
  }) async {
    // Ensure headers includes 'Content-Type: application/json'
    final updatedHeaders = {
      'Content-Type': 'application/json',
      ...?headers, // Merge with any additional headers provided
    };

    var response = await http.post(
      Uri.parse(url),
      headers: updatedHeaders,
      body: jsonEncode(bodyData),
    );

    return response;
  }
  // Future<http.Response> delete(Uri url, var bodyData) async {
  //   var response = await client.delete(url, body: bodyData, headers: {
  //     STRING_CONTENT_TYPE: STRING_APPLICATION_JSON,
  //     STRING_ACCESS_TOKEN_KEY: token
  //   });
  //   return response;
  // }

  // Future<http.Response> put(Uri url, var bodyData) async {
  //   var token = 'Bearer ${UserHelpers.getAuthToken()}';
  //   var response = await client.put(url, body: bodyData, headers: {
  //     STRING_CONTENT_TYPE: STRING_APPLICATION_JSON,
  //     STRING_ACCESS_TOKEN_KEY: token
  //   });
  //   return response;
  // }

  Future<http.Response> createMultipartRequest(
      {required Uri url,
      required Map<String, String> requestFields,
      required FileModel imageFile}) async {
    // final headers = {};
    var requestMultipart = http.MultipartRequest('POST', url)
      // ..headers.addAll(headers)
      ..fields.addAll(requestFields)
      ..files.add(http.MultipartFile(
        imageFile.key,
        imageFile.file.readAsBytes().asStream(),
        imageFile.file.lengthSync(),
        filename: imageFile.file.path.split('/').last,
      ));
    try {
      final streamedResponse = await client.send(requestMultipart);
      final response = await http.Response.fromStream(streamedResponse);
      return response;
    } catch (e) {
      throw Exception('Failed to post fueling request: $e');
    }
  }
}

class FileModel {
  final String key;
  final File file;

  FileModel({required this.key, required this.file});

  Map<String, File> toJson() => {'key': file};

  FileModel copyWith({String? key, File? file}) =>
      FileModel(key: key ?? this.key, file: file ?? this.file);

  factory FileModel.toEmpty() => FileModel(key: '', file: File(''));
}
