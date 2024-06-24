// import 'package:bloc/bloc.dart';
// import 'package:provodnik/domain/models/login.dart';
// import 'package:provodnik/infostructure/session_data_provider/session_data_provider.dart';

// part 'check_auth_event.dart';
// part 'check_auth_state.dart';

// class CheckAuthBloc extends Bloc<CheckAuthEvent, CheckAuthState> {
//   // final LoadingCubit loadingCubit;
//   final SessionDataProvider _sessionDataProvider;
//   CheckAuthBloc(
//     this._sessionDataProvider,
//   ) : super(CheckAuthInitial()) {
//     on<CheckAuthEvent>((event, emit) async {
//       if (event is AuthCheckStatusEvent) {
//         await onAuthCheckStatusEvent(event, emit);
//       } else if (event is AuthLoginEvent) {
//         // await onAuthLoginEvent(event, emit);
//       } else if (event is AuthLogoutEvent) {
//         // await onAuthLogoutEvent(event, emit);
//       }
//     });
//     add(AuthCheckStatusEvent());
//   }

//   Future<void> onAuthCheckStatusEvent(
//     AuthCheckStatusEvent event,
//     Emitter<CheckAuthState> emit,
//   ) async {
//     LoginModel? userInfo = await _sessionDataProvider.getUserInfo();
//     if (userInfo != null) {
//       emit(AuthAuthorizedState());
//     } else {
//       emit(AuthUnauthorizedState());
//     }
//   }
// }
