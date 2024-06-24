// import 'package:provodnik/domain/core/exeption.dart';
// import 'package:provodnik/domain/models/error_model.dart';
// import 'package:provodnik/domain/models/client.dart';
// import 'package:dartz/dartz.dart';
// import 'package:provodnik/domain/repository/get_client_remote_data_source.dart';
// import 'package:provodnik/domain/repository/get_client_repo.dart';

// class GetClientRepoImpl extends GetClientRepo {
//   final GetClientRemoteDataSource _getClientRemoteDataSource;

//   GetClientRepoImpl(this._getClientRemoteDataSource);
//   @override
//   Future<Either<ErrorModel, List<ClientModel>>> getClient() async {
//     try {
//       final resultClient = await _getClientRemoteDataSource.getClient();
//       return Right(resultClient);
//     } on ServerException catch (error) {
//       return Left(ErrorModel.fromJson(error.erorr));
//     }
//   }
// }
