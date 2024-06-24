// import 'package:dartz/dartz.dart';
// import 'package:provodnik/domain/core/exeption.dart';
// import 'package:provodnik/domain/models/client_place.dart';
// import 'package:provodnik/domain/models/error_model.dart';
// import 'package:provodnik/domain/models/login.dart';
// import 'package:provodnik/domain/models/request_model.dart';
// import 'package:provodnik/domain/models/status_request_list.dart';
// import 'package:provodnik/domain/repository/request_remote_data_source.dart';
// import 'package:provodnik/domain/repository/request_repo.dart';
// import 'package:provodnik/infostructure/session_data_provider/session_data_provider.dart';

// class RequestRepoImpl extends RequestRepo {
//   final RequestRemoteDataSource _requestRemoteDataSource;
//   final SessionDataProvider _sessionDataProvider;

//   RequestRepoImpl(this._requestRemoteDataSource, this._sessionDataProvider);

//   @override
//   Future<LoginModel> getUserInfo() async {
//     try {
//       final userInfo = await _sessionDataProvider.getUserInfo();
//       if (userInfo != null) {
//         return userInfo;
//       }
//       return throw Exception('error get userInfo');
//     } on Exception {
//       throw Exception('error get userInfo');
//     }
//   }

//   @override
//   Future<Either<ErrorModel, Unit>> addRequest(
//       int clientPlaceId, String content, Map<String, dynamic>? filePath) async {
//     try {
//       LoginModel userInfo = await getUserInfo();
//       await _requestRemoteDataSource.addRequest(
//           userInfo.userId, clientPlaceId, content, filePath);
//       return const Right(unit);
//     } on ServerException catch (error) {
//       return Left(ErrorModel.fromJson(error.erorr));
//     }
//   }

//   @override
//   Future<Either<ErrorModel, List<ClientPlaceModel>>> getLocationClient(
//       int clientId) async {
//     try {
//       final allLocationPlace =
//           await _requestRemoteDataSource.getLocationClient(clientId);
//       return Right(allLocationPlace);
//     } on ServerException catch (error) {
//       return Left(ErrorModel.fromJson(error.erorr));
//     }
//   }

//   @override
//   Future<Either<ErrorModel, List<RequestModel>>> getAllRequest(
//       bool isForcedRequest) async {
//     try {
//       final allRequest =
//           await _requestRemoteDataSource.getAllRequest(isForcedRequest);
//       return Right(allRequest);
//     } on ServerException catch (error) {
//       return Left(ErrorModel.fromJson(error.erorr));
//     }
//   }

//   @override
//   Future<Either<ErrorModel, Unit>> updateStatusRequest(
//       {required int requestId, required int status}) async {
//     try {
//       LoginModel userInfo = await getUserInfo();
//       await _requestRemoteDataSource.updateStatusRequest(
//           requestId: requestId, userId: userInfo.userId, status: status);
//       return const Right(unit);
//     } on ServerException catch (error) {
//       return Left(ErrorModel.fromJson(error.erorr));
//     }
//   }

//   @override
//   Future<Either<ErrorModel, List<StatusRequestListModel>>>
//       getAllRequestStatus() async {
//     try {
//       final allRequestStatus =
//           await _requestRemoteDataSource.getAllRequestStatus();
//       return Right(allRequestStatus);
//     } on ServerException catch (error) {
//       return Left(ErrorModel.fromJson(error.erorr));
//     }
//   }
// }
