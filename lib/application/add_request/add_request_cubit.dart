// import 'package:bloc/bloc.dart';
// import 'package:dartz/dartz.dart';
// import 'package:equatable/equatable.dart';
// import 'package:meta/meta.dart';
// import 'package:provodnik/application/loading/loading_cubit.dart';
// import 'package:provodnik/domain/models/client_place.dart';
// import 'package:provodnik/domain/models/error_model.dart';
// import 'package:provodnik/domain/repository/request_repo.dart';

// part 'add_request_state.dart';

// class AddRequestCubit extends Cubit<AddRequestState> {
//   final RequestRepo _requestRepo;
//   final LoadingCubit _loadingCubit;
//   AddRequestCubit(this._requestRepo, this._loadingCubit)
//       : super(const AddRequestState());

//   void resetState() {
//     // if (isClosed) return;
//     emit(state.copyWith(clientPlaceModel: null));
//   }

//   void contentChange({required String content}) {
//     emit(state.copyWith(
//       content: content,
//       status: AddRequestStatus.initial,
//     ));
//   }

//   void clientChange({required int client}) async {
//     Either<ErrorModel, List<ClientPlaceModel>> failureOrSuccessLogin;

//     failureOrSuccessLogin = await _requestRepo.getLocationClient(client);

//     failureOrSuccessLogin.fold(
//         (l) => emit(
//               AddRequestState(
//                 status: AddRequestStatus.failure,
//                 errorModel: l,
//               ),
//             ), (r) {
//       emit(state.copyWith(
//         client: client,
//         clientPlaceModel: r,
//         status: AddRequestStatus.initial,
//       ));
//     });
//   }

//   Future<void> addRequest(String? requstPhotoPath) async {
//     Either<ErrorModel, Unit> failureOrSuccessLogin;

//     final Map<String, dynamic> filePath = {
//       'requestPhoto': requstPhotoPath,
//     };
//     emit(state.copyWith(
//       status: AddRequestStatus.loading,
//     ));
//     _loadingCubit.show();
//     failureOrSuccessLogin = await _requestRepo.addRequest(
//         state.client, state.content, requstPhotoPath != null ? filePath : null);

//     failureOrSuccessLogin.fold(
//         (l) => emit(
//               AddRequestState(
//                 status: AddRequestStatus.failure,
//                 errorModel: l,
//               ),
//             ), (r) {
//       emit(const AddRequestState(status: AddRequestStatus.success));
//     });
//     _loadingCubit.hide();
//   }
// }
