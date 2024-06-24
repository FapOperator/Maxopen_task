// import 'package:provodnik/domain/core/api_client.dart';
// import 'package:provodnik/domain/models/client.dart';
// import 'package:provodnik/domain/repository/get_client_remote_data_source.dart';

// class ImplGetClientRemoteDataSource extends GetClientRemoteDataSource {
//   final ApiClient _client;

//   ImplGetClientRemoteDataSource(this._client);

//   @override
//   Future<List<ClientModel>> getClient() async {
//     List response = await _client.getWithCache(
//       'get_client',
//       cacheTime: 3600,
//       nameFileCache: 'client',
//     );
//     final result = response.map((data) => ClientModel.fromJson(data)).toList();
//     return result;
//   }
// }
