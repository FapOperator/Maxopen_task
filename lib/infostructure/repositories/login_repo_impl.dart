// import 'package:provodnik/domain/core/exeption.dart';
// import 'package:provodnik/domain/models/error_model.dart';
// import 'package:provodnik/domain/models/login.dart';
// import 'package:dartz/dartz.dart';
// import 'package:provodnik/domain/repository/login_remote_data_source.dart';
// import 'package:provodnik/domain/repository/login_repo.dart';

// class LoginRepoImpl extends LoginRepo {
//   final LoginRemoteDataSource _loginRemoteDataSource;

//   LoginRepoImpl(this._loginRemoteDataSource);
//   @override
//   Future<Either<ErrorModel, LoginModel>> loginApp(
//       String userName, String password) async {
//     try {
//       final login = await _loginRemoteDataSource.loginApp(userName, password);
//       return Right(login);
//     } on ServerException catch (error) {
//       return Left(ErrorModel.fromJson(error.erorr));
//     }
//   }
// }
