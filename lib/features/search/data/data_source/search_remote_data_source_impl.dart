import 'package:maxopen_task/core/common/api_constant.dart';
import 'package:maxopen_task/core/api_client.dart';
import 'package:maxopen_task/features/home_screen/domain/models/movies.dart';
import 'package:maxopen_task/features/search/domain/data_source/search_remote_data_source.dart';

class SearchRemoteDataSourceImpl implements SearchRemoteDataSource {
  final ApiClient _client;

  SearchRemoteDataSourceImpl(this._client);

  @override
  Future<List<Movie>> getSearchMovies(String query, String locale) async {
    final response = await _client.getWithCache(
      '/3/search/movie',
      cacheTime: 3600,
      nameFileCache: 'search',
      params: {
        'language': locale,
        'query': query,
      },
      token: ApiConstants.API_TOKEN,
    );
    List<Movie> result =
        List.from(response['results'].map((data) => Movie.fromJson(data)));
    return result;
  }
}
