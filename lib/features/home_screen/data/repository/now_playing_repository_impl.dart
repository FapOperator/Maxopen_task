import 'package:maxopen_task/core/exeption.dart';
import 'package:maxopen_task/features/home_screen/domain/data_source/now_playing_remote_data_source.dart';
import 'package:maxopen_task/features/home_screen/domain/models/movies.dart';
import 'package:maxopen_task/features/home_screen/domain/repository/now_playing_repository.dart';

class NowPlayingRepositoryImpl implements NowPlayingRepository {
  final NowPlayingRemoteDataSource _nowPlayingRemoteDataSource;

  NowPlayingRepositoryImpl(this._nowPlayingRemoteDataSource);
  @override
  Future<List<Movie>> getNowPlayingMovies() async {
    try {
      final resultClient =
          await _nowPlayingRemoteDataSource.getNowPlayingMovies();
      return resultClient;
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }
}
