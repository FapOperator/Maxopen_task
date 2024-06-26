import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;
import 'package:maxopen_task/core/common/api_constant.dart';
import 'package:maxopen_task/core/exeption.dart';
import 'package:path_provider/path_provider.dart';

class ApiClient {
  final http.Client _client;

  ApiClient(this._client);

  Uri _getPath(String path, Map<dynamic, dynamic>? params) {
    var paramsString = '?';
    if (params?.isNotEmpty ?? false) {
      params?.forEach((dynamic key, dynamic value) {
        paramsString += '$key=$value&';
      });
    }

    return Uri.parse('${ApiConstants.BASE_URL}$path$paramsString');
  }

  dynamic getWithCache(
    String path, {
    String? token,
    int cacheTime = 30,
    bool isForcedRequest = false,
    required String nameFileCache,
    Map<dynamic, dynamic>? params,
  }) async {
    final cacheFile = await DefaultCacheManager()
        .getFileFromCache(_getPath(path, params).toString());
    if (cacheFile != null &&
        cacheFile.validTill.isAfter(DateTime.now()) &&
        !isForcedRequest) {
      if (kDebugMode) {
        print('file cache');
      }

      return json.decode(cacheFile.file.readAsStringSync());
    } else {
      final response = await _client.get(
        _getPath(path, params),
        headers: {
          'Content-Type': 'application/json',
          "Authorization": "Bearer $token"
        },
      );

      if (response.body.contains('"error":true')) {
        throw ServerException(erorr: json.decode(response.body));
      } else if (response.statusCode == 200) {
        getApplicationDocumentsDirectory().then((Directory directory) {
          final dir = directory;
          final jsonFile = File('${dir.path}/$nameFileCache.json');
          DefaultCacheManager().putFile(
            jsonFile.path,
            response.bodyBytes,
            key: _getPath(path, params).toString(),
            maxAge: Duration(
              seconds: cacheTime,
            ),
          );
        });
        if (kDebugMode) {
          print('file no cache');
        }
        return json.decode(response.body);
      } else if (response.statusCode == 400) {
        throw ServerException(
            erorr: json.decode(response.body)['results'] as List);
      } else {
        throw Exception(response.reasonPhrase);
      }
    }
  }
}
