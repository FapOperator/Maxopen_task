// import 'package:provodnik/domain/core/api_client.dart';
// import 'package:provodnik/domain/models/login.dart';
// import 'package:provodnik/domain/repository/login_remote_data_source.dart';

// class ImplLoginRemoteDataSource extends LoginRemoteDataSource {
//   final ApiClient _client;

//   ImplLoginRemoteDataSource(this._client);
//   @override
//   Future<LoginModel> loginApp(String userName, String password) async {
//     final response = await _client.post(
//       'login',
//       params: {
//         'username': userName,
//         'password': password,
//       },
//     );
//     final result = LoginModel.fromJson(response);
//     return result;
//   }
// }
