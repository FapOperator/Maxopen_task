import 'package:maxopen_task/features/home_screen/domain/models/movies.dart';

abstract class SearchRepository {
  Future<List<Movie>> getSearchMovies(String query, String locale);
}
