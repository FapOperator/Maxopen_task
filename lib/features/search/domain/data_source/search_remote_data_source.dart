import 'package:maxopen_task/features/home_screen/domain/models/movies.dart';

abstract class SearchRemoteDataSource {
  Future<List<Movie>> getSearchMovies(String query);
}
