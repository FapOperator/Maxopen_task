// import 'package:bloc/bloc.dart';
// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
// import 'package:provodnik/domain/models/error_model.dart';
// import 'package:provodnik/domain/models/request_model.dart';
// import 'package:provodnik/domain/models/status_request_list.dart';
// import 'package:provodnik/domain/repository/request_repo.dart';

// part 'request_get_or_update_state.dart';

// class RequestGetOrUpdateCubit extends Cubit<RequestGetOrUpdateState> {
//   final RequestRepo _requestRepo;
//   RequestGetOrUpdateCubit(this._requestRepo)
//       : super(RequestGetOrUpdateInitial());
//   // isForcedRequest переменная изначально имеет false.
//   //отвечает за нужно ли принудительно получить данные с сервера или брать с кэша(если он есть)
//   Future<void> getAllRequest({bool isForcedRequest = false}) async {
//     // if (isClosed) return;
//     Either<ErrorModel, List<RequestModel>> failureOrSuccessGetRequest;
//     Either<ErrorModel, List<StatusRequestListModel>>
//         failureOrSuccessGetStatusList;
//     emit(RequestGetOrUpdateLoading());
//     failureOrSuccessGetRequest =
//         await _requestRepo.getAllRequest(isForcedRequest);

//     failureOrSuccessGetRequest.fold(
//         (l) => emit(RequestGetOrUpdateError(error: l)), (requestList) async {
//       failureOrSuccessGetStatusList = await _requestRepo.getAllRequestStatus();
//       failureOrSuccessGetStatusList.fold((l) {}, (statusList) {
//         emit(RequestGetOrUpdateLoaded(
//           requestModel: requestList,
//           statusRequestListModel: statusList,
//         ));
//       });
//     });
//   }

//   Future<void> updateRequest({
//     required int requestId,
//     required int status,
//   }) async {
//     Either<ErrorModel, Unit> failureOrSuccessLogin;
//     emit(RequestGetOrUpdateLoading());
//     failureOrSuccessLogin = await _requestRepo.updateStatusRequest(
//         requestId: requestId, status: status);

//     failureOrSuccessLogin.fold((l) => emit(RequestGetOrUpdateError(error: l)),
//         (r) {
//       emit(RequestGetOrUpdateSuccesUpdate());
//     });
//   }
// }
