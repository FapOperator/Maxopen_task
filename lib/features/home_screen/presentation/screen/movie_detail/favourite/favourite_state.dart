part of 'favourite_cubit.dart';

@immutable
sealed class FavouriteState extends Equatable {}

final class FavouriteInitial extends FavouriteState {
  @override
  List<Object> get props => [];
}

class IsFavoriteMovie extends FavouriteState {
  final bool isMovieFavorite;

  IsFavoriteMovie(this.isMovieFavorite);
  @override
  List<Object> get props => [isMovieFavorite];
}

class LoadFavoriteMovie extends FavouriteState {
  final List<Movie> movie;

  LoadFavoriteMovie(this.movie);
  @override
  List<Object> get props => [movie];
}
