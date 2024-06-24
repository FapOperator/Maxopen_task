import 'package:maxopen_task/features/home_screen/domain/models/movies.dart';

abstract class TopFiveRemoteDataSource {
  Future<List<Movie>> getTopFiveMovies();
}
