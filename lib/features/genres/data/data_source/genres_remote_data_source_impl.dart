import 'package:maxopen_task/core/common/api_constant.dart';
import 'package:maxopen_task/core/api_client.dart';
import 'package:maxopen_task/features/genres/domain/data_source/genres_remote_data_source.dart';
import 'package:maxopen_task/features/genres/domain/model/genres_model.dart';

class GenresRemoteDataSourceImpl implements GenresRemoteDataSource {
  final ApiClient _client;

  GenresRemoteDataSourceImpl(this._client);

  @override
  Future<List<GenresModel>> getGenres(String locale) async {
    final response = await _client.getWithCache(
      '/3/genre/movie/list',
      cacheTime: 3600,
      nameFileCache: 'genresList',
      params: {'language': locale.substring(0, 2)},
      token: ApiConstants.API_TOKEN,
    );
    List<GenresModel> result =
        List.from(response['genres'].map((data) => GenresModel.fromJson(data)));
    return result;
  }
}
