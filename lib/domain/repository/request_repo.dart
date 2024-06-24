// import 'package:dartz/dartz.dart';
// import 'package:provodnik/domain/models/client_place.dart';
// import 'package:provodnik/domain/models/error_model.dart';
// import 'package:provodnik/domain/models/request_model.dart';
// import 'package:provodnik/domain/models/status_request_list.dart';

// abstract class RequestRepo {
//   Future<Either<ErrorModel, Unit>> addRequest(
//     int clientPlaceId,
//     String content,
//     Map<String, dynamic>? filePath,
//   );
//   Future<Either<ErrorModel, List<ClientPlaceModel>>> getLocationClient(
//     int clientId,
//   );

//   Future<dynamic> getUserInfo();

//   Future<Either<ErrorModel, List<RequestModel>>> getAllRequest(
//       bool isForcedRequest);

//   Future<Either<ErrorModel, Unit>> updateStatusRequest({
//     required int requestId,
//     required int status,
//   });

//   Future<Either<ErrorModel, List<StatusRequestListModel>>>
//       getAllRequestStatus();
// }
