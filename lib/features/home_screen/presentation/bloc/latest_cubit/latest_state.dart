part of 'latest_cubit.dart';

@immutable
sealed class LatestState {}

class LatestInitial extends LatestState {}

class LatestLoading extends LatestState {}

class LatestLoaded extends LatestState {
  final List<Movie> movieModel;

  LatestLoaded({
    required this.movieModel,
  });
}

class LatestError extends LatestState {
  // final ErrorModel error;

  // ClientListError({required this.error});
}
