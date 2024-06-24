import 'package:maxopen_task/common/api_constant.dart';
import 'package:maxopen_task/core/api_client.dart';
import 'package:maxopen_task/features/home_screen/domain/data_source/top_five_remote_data_source.dart';
import 'package:maxopen_task/features/home_screen/domain/models/movies.dart';
import 'package:maxopen_task/features/home_screen/domain/models/top_five_movies.dart';

class TopFiveRemoteDataSourceImpl implements TopFiveRemoteDataSource {
  final ApiClient _client;

  TopFiveRemoteDataSourceImpl(this._client);

  @override
  Future<List<Movie>> getTopFiveMovies() async {
    final response = await _client.getWithCache(
      '/3/movie/popular',
      cacheTime: 3600,
      nameFileCache: 'topFive',
      params: {'language': 'en-US'},
      token: ApiConstants.API_TOKEN,
    );
    List<Movie> result =
        List.from(response['results'].map((data) => Movie.fromJson(data)));
    // response['results'].map((data) => Movie.fromJson(data)).toList();
    print(result);
    return result;
  }
}
