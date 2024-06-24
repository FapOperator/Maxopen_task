// part of 'add_request_cubit.dart';

// enum AddRequestStatus { initial, loading, success, failure }

// @immutable
// class AddRequestState extends Equatable {
//   final int client;
//   final String content;
//   final List<ClientPlaceModel>? clientPlaceModel;
//   final ErrorModel? errorModel;
//   final AddRequestStatus status;

//   const AddRequestState({
//     this.client = 0,
//     this.content = '',
//     this.errorModel,
//     this.clientPlaceModel,
//     this.status = AddRequestStatus.initial,
//   });

//   @override
//   List<Object?> get props => [status, client, content, clientPlaceModel];

//   AddRequestState copyWith({
//     int? client,
//     String? content,
//     List<ClientPlaceModel>? clientPlaceModel,
//     ErrorModel? errorModel,
//     AddRequestStatus? status,
//   }) {
//     return AddRequestState(
//       clientPlaceModel: clientPlaceModel ?? this.clientPlaceModel,
//       status: status ?? this.status,
//       errorModel: errorModel ?? this.errorModel,
//       client: client ?? this.client,
//       content: content ?? this.content,
//     );
//   }
// }
