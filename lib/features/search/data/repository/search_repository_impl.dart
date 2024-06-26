import 'package:maxopen_task/core/exeption.dart';
import 'package:maxopen_task/features/home_screen/domain/models/movies.dart';
import 'package:maxopen_task/features/search/domain/data_source/search_remote_data_source.dart';
import 'package:maxopen_task/features/search/domain/repository/search_repository.dart';

class SearchRepositoryImpl implements SearchRepository {
  final SearchRemoteDataSource _searchRemoteDataSource;

  SearchRepositoryImpl(this._searchRemoteDataSource);
  @override
  Future<List<Movie>> getSearchMovies(String query, String locale) async {
    try {
      final resultClient =
          await _searchRemoteDataSource.getSearchMovies(query, locale);
      return resultClient;
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }
}
