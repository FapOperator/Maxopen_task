import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:maxopen_task/features/home_screen/domain/models/movies.dart';
import 'package:maxopen_task/features/bookmarks/local_db/favourite_manager.dart';
import 'package:meta/meta.dart';

part 'favourite_state.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  final FavouriteManager _favouriteManager;
  FavouriteCubit(this._favouriteManager) : super(FavouriteInitial());

  Future<void> toogleFavourite(Movie movie, bool isFavorite) async {
    if (isFavorite) {
      _favouriteManager.deleteMovie(movie.id);
    } else {
      _favouriteManager.saveMovie(movie);
    }
    bool result = await _favouriteManager.checkIfMovieFavorite(movie.id);
    emit(IsFavoriteMovie(result));
  }

  Future<void> checkIfFavoriteMovie(int movieId) async {
    bool result = await _favouriteManager.checkIfMovieFavorite(movieId);
    emit(IsFavoriteMovie(result));
  }

  Future<void> getFavoriteMovie() async {
    List<Movie> result = await _favouriteManager.getMovies();
    emit(LoadFavoriteMovie(result));
  }
}
