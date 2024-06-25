import 'package:hive/hive.dart';
import 'package:maxopen_task/features/home_screen/domain/models/movies.dart';

class FavouriteManager {
  Future<void> saveMovie(Movie movieTable) async {
    final movieBox = await Hive.openBox('movieBox');
    await movieBox.put(movieTable.id, movieTable);
  }

  Future<bool> checkIfMovieFavorite(int movieId) async {
    final movieBox = await Hive.openBox('movieBox');
    return movieBox.containsKey(movieId);
  }

  Future<void> deleteMovie(int movieId) async {
    final movieBox = await Hive.openBox('movieBox');
    await movieBox.delete(movieId);
  }

  Future<List<Movie>> getMovies() async {
    final movieBox = await Hive.openBox('movieBox');
    final movieIds = movieBox.keys;
    List<Movie> movies = [];
    movieIds.forEach((movieId) {
      movies.add(movieBox.get(movieId));
    });
    return movies;
  }
}
