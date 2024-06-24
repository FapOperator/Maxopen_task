// import 'package:bloc/bloc.dart';
// import 'package:dartz/dartz.dart';
// import 'package:meta/meta.dart';
// import 'package:provodnik/domain/models/client.dart';
// import 'package:provodnik/domain/models/error_model.dart';
// import 'package:provodnik/domain/repository/get_client_repo.dart';

// part 'client_list_state.dart';

// class ClientListCubit extends Cubit<ClientListState> {
//   final GetClientRepo _getClientRepo;
//   ClientListCubit(this._getClientRepo) : super(ClientListInitial());

//   Future<void> getClient() async {
//     if (isClosed) return;
//     Either<ErrorModel, List<ClientModel>> failureOrSuccessLogin;
//     // emit(ClientListLoading());
//     failureOrSuccessLogin = await _getClientRepo.getClient();

//     failureOrSuccessLogin.fold((l) => emit(ClientListError(error: l)), (r) {
//       emit(ClientListLoaded(clientModel: r));
//     });
//   }
// }
