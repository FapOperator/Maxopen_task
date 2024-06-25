// import 'dart:convert';

// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:provodnik/domain/models/login.dart';

// abstract class _Keys {
//   static const userInfo = 'user_info';
// }

// class SessionDataProvider {
//   static const _secureStorage = FlutterSecureStorage();
//   Future<void> setUserInfo(String value) {
//     return _secureStorage.write(key: _Keys.userInfo, value: value);
//   }

//   Future<LoginModel?> getUserInfo() async {
//     final data = await _secureStorage.read(key: _Keys.userInfo);
//     if (data != null) {
//       Map<String, dynamic> decodedMap = json.decode(data);
//       return LoginModel.fromJson(decodedMap);
//     } else {
//       return null;
//     }
//   }

//   Future<void> deleteUserInfo() {
//     return _secureStorage.delete(key: _Keys.userInfo);
//   }
// }
