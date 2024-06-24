// import 'package:provodnik/domain/core/api_client.dart';
// import 'package:provodnik/domain/models/client_place.dart';
// import 'package:provodnik/domain/models/request_model.dart';
// import 'package:provodnik/domain/models/status_request_list.dart';
// import 'package:provodnik/domain/repository/request_remote_data_source.dart';

// class ImplRequestRemoteDataSource extends RequestRemoteDataSource {
//   final ApiClient _client;

//   ImplRequestRemoteDataSource(this._client);

//   @override
//   Future<void> addRequest(int userId, int clientPlaceId, String content,
//       Map<String, dynamic>? filePath) async {
//     await _client.postWithFiles(
//       'add_request',
//       filePath: filePath,
//       params: {
//         'createUserId': userId,
//         'clientPlaceId': clientPlaceId,
//         'content': content,
//       },
//     );
//   }

//   @override
//   Future<List<ClientPlaceModel>> getLocationClient(int clientId) async {
//     List response = await _client.post(
//       'getClientPlace',
//       params: {
//         'clientId': clientId,
//       },
//     );
//     final result =
//         response.map((data) => ClientPlaceModel.fromJson(data)).toList();
//     return result;
//   }

//   @override
//   Future<List<RequestModel>> getAllRequest(bool isForcedRequest) async {
//     List response = await _client.getWithCache(
//       'getAllRequest',
//       isForcedRequest: isForcedRequest,
//       nameFileCache: 'requestList',
//     );
//     final result = response.map((data) => RequestModel.fromJson(data)).toList();
//     return result;
//   }

//   @override
//   Future<void> updateStatusRequest(
//       {required int requestId,
//       required int userId,
//       required int status}) async {
//     await _client.post(
//       'updateStatusRequest',
//       params: {
//         'updateUserId': userId,
//         'requestId': requestId,
//         'status': status,
//       },
//     );
//   }

//   @override
//   Future<List<StatusRequestListModel>> getAllRequestStatus() async {
//     List response = await _client.getWithCache('getRequestStatusList',
//         nameFileCache: 'requestStatusList');
//     final result =
//         response.map((data) => StatusRequestListModel.fromJson(data)).toList();
//     return result;
//   }
// }
