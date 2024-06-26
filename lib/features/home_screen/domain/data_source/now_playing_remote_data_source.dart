import 'package:maxopen_task/features/home_screen/domain/models/movies.dart';

abstract class NowPlayingRemoteDataSource {
  Future<List<Movie>> getNowPlayingMovies(String locale);
}
