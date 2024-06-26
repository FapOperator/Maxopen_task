import 'package:maxopen_task/core/common/api_constant.dart';
import 'package:maxopen_task/core/api_client.dart';
import 'package:maxopen_task/features/home_screen/domain/data_source/now_playing_remote_data_source.dart';
import 'package:maxopen_task/features/home_screen/domain/models/movies.dart';

class NowPlayingRemoteDataSourceImpl implements NowPlayingRemoteDataSource {
  final ApiClient _client;

  NowPlayingRemoteDataSourceImpl(this._client);

  @override
  Future<List<Movie>> getNowPlayingMovies(String locale) async {
    final response = await _client.getWithCache(
      '/3/movie/popular',
      cacheTime: 3600,
      nameFileCache: 'topFive',
      params: {'language': locale},
      token: ApiConstants.API_TOKEN,
    );
    List<Movie> result =
        List.from(response['results'].map((data) => Movie.fromJson(data)));

    return result;
  }
}
