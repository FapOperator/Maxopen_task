import 'package:maxopen_task/features/home_screen/domain/models/movies.dart';

abstract class TopFiveRepository {
  Future<List<Movie>> getTopFiveMovies();
}
