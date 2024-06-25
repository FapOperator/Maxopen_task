part of 'genres_cubit.dart';

@immutable
sealed class GenresState {}

class GenresInitial extends GenresState {}

class GenresLoading extends GenresState {}

class GenresLoaded extends GenresState {
  final List<GenresModel> genresModel;

  GenresLoaded({required this.genresModel});
}

class LatestError extends GenresState {
  // final ErrorModel error;

  // ClientListError({required this.error});
}
