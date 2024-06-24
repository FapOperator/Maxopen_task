// import 'dart:convert';

// import 'package:bloc/bloc.dart';
// import 'package:dartz/dartz.dart';
// import 'package:meta/meta.dart';
// import 'package:provodnik/domain/models/error_model.dart';
// import 'package:provodnik/domain/models/login.dart';
// import 'package:provodnik/domain/repository/login_repo.dart';
// import 'package:provodnik/infostructure/session_data_provider/session_data_provider.dart';

// part 'login_state.dart';

// class LoginCubit extends Cubit<LoginState> {
//   final LoginRepo _loginRepo;
//   final SessionDataProvider _sessionDataProvider;
//   LoginCubit(this._loginRepo, this._sessionDataProvider)
//       : super(LoginInitial());

//   Future<void> loginApp(String userName, String password) async {
//     Either<ErrorModel, LoginModel> failureOrSuccessLogin;
//     emit(LoginLoading());
//     failureOrSuccessLogin = await _loginRepo.loginApp(userName, password);

//     failureOrSuccessLogin.fold((l) => emit(LoginError(error: l)), (r) {
//       String encodedStringLoginModel = json.encode(r);
//       _sessionDataProvider.setUserInfo(encodedStringLoginModel);
//       emit(LoginDone(loginModel: r));
//     });
//   }
// }
