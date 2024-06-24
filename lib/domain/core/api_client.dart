import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:http/http.dart' as http;
import 'package:maxopen_task/common/api_constant.dart';
import 'package:maxopen_task/domain/core/exeption.dart';
import 'package:path_provider/path_provider.dart';

class ApiClient {
  final http.Client _client;

  ApiClient(this._client);

  Uri _getPath(String path, Map<dynamic, dynamic>? params) {
    var paramsString = '';
    if (params?.isNotEmpty ?? false) {
      params?.forEach((dynamic key, dynamic value) {
        paramsString += '?$key=$value';
      });
    }

    return Uri.parse('${ApiConstants.BASE_URL}$path.php$paramsString');
  }

  dynamic post(String path,
      {Map<dynamic, dynamic>? params, String? token}) async {
    final response = await _client.post(
      _getPath(path, null),
      body: jsonEncode(params),
      headers: {
        "Access-Control-Allow-Headers": "*",
        'Content-Type': 'application/json; charset=UTF-8',
      },
    );

    if (response.body.contains('"error":true')) {
      throw ServerException(erorr: json.decode(response.body));
    } else if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 400) {
      throw ServerException(erorr: json.decode(response.body));
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic postWithFiles(String path,
      {required Map<String, dynamic> params,
      required Map<String, dynamic>? filePath}) async {
    final request = http.MultipartRequest(
      'POST',
      _getPath(path, null),
    );
    request.headers.addAll({
      "Access-Control-Allow-Headers": "*",
      'Content-Type': 'application/json; charset=UTF-8',
    });
    if (filePath == null) {
      await Future.wait(
        params.entries.map((MapEntry mapEntry) async {
          if (mapEntry.value != null && mapEntry.key != filePath?.keys) {
            request.fields.addAll({mapEntry.key: mapEntry.value.toString()});
          }
        }),
      );
    } else {
      await Future.wait(
        params.entries.map((MapEntry mapEntry) async {
          if (mapEntry.value != null && mapEntry.key != filePath.keys) {
            request.fields.addAll({mapEntry.key: mapEntry.value.toString()});
          }
        }),
      );
      await Future.wait(
        filePath.entries.map((MapEntry mapEntry) async {
          request.files.add(
              await http.MultipartFile.fromPath(mapEntry.key, mapEntry.value));
        }),
      );
    }

    // request.fields.addAll(params);

    http.StreamedResponse response = await request.send();
    if (response.statusCode == 200) {
      var responseByteArray = await response.stream.toBytes();
      return json.decode(utf8.decode(responseByteArray));
    } else if (response.statusCode == 400) {
      throw ServerException(erorr: 'error');
    } else {
      throw Exception(response.reasonPhrase);
    }
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
          "Authorization": "Token $token"
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
        throw ServerException(erorr: json.decode(response.body));
      } else {
        throw Exception(response.reasonPhrase);
      }
    }
  }
}
