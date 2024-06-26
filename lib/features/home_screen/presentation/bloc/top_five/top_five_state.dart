part of 'top_five_cubit.dart';

@immutable
sealed class TopFiveState {}

class TopFiveInitial extends TopFiveState {}

class TopFiveLoading extends TopFiveState {}

class TopFiveLoaded extends TopFiveState {
  final List<Movie> movieModel;

  TopFiveLoaded({required this.movieModel});
}

class TopFiveError extends TopFiveState {}
