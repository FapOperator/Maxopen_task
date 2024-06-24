part of 'loader_cubit.dart';

abstract class LoaderState {}

class LoaderInitial extends LoaderState {}

class LoaderAuthorized extends LoaderState {}

class LoaderNotAuthorized extends LoaderState {}
