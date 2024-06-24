import 'package:maxopen_task/features/home_screen/domain/models/movies.dart';

abstract class NowPlayingRepository {
  Future<List<Movie>> getNowPlayingMovies();
}
