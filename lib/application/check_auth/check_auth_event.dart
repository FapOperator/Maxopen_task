part of 'check_auth_bloc.dart';

abstract class CheckAuthEvent {}

class AuthCheckStatusEvent extends CheckAuthEvent {}

class AuthLogoutEvent extends CheckAuthEvent {}

class AuthLoginEvent extends CheckAuthEvent {}
