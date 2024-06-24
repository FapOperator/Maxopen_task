part of 'check_auth_bloc.dart';

abstract class CheckAuthState {}

class CheckAuthInitial extends CheckAuthState {}

class AuthAuthorizedState extends CheckAuthState {}

class AuthUnauthorizedState extends CheckAuthState {}
