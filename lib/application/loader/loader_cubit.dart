// import 'dart:async';

// import 'package:bloc/bloc.dart';
// import 'package:provodnik/application/check_auth/check_auth_bloc.dart';
// import 'package:provodnik/domain/models/login.dart';
// import 'package:provodnik/infostructure/session_data_provider/session_data_provider.dart';

// part 'loader_state.dart';

// class LoaderCubit extends Cubit<LoaderState> {
//   final CheckAuthBloc checkAuthBloc;
//   final SessionDataProvider _sessionDataProvider;
//   late final StreamSubscription<CheckAuthState> authBlocSubscription;
//   LoaderCubit(
//     this.checkAuthBloc,
//     this._sessionDataProvider,
//   ) : super(LoaderInitial()) {
//     Future.microtask(
//       () async {
//         // _onState(checkAuthBloc.state);
//         authBlocSubscription = checkAuthBloc.stream.listen(_onState);
//         checkAuthBloc.add(AuthCheckStatusEvent());
//       },
//     );
//   }

//   void _onState(CheckAuthState state) async {
//     if (isClosed) return;
//     if (state is AuthAuthorizedState) {
//       LoginModel? userInfo = await _sessionDataProvider.getUserInfo();

//       if (userInfo != null) {
//         emit(LoaderAuthorized());
//       }
//     } else if (state is AuthUnauthorizedState) {
//       emit(LoaderNotAuthorized());
//     }
//   }

//   @override
//   Future<void> close() {
//     authBlocSubscription.cancel();
//     return super.close();
//   }
// }
