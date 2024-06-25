part of 'search_cubit.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

class SearchLoaded extends SearchState {
  final List<Movie> movie;

  SearchLoaded({required this.movie});
}
