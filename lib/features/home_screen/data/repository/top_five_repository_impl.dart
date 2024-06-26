import 'package:maxopen_task/core/exeption.dart';
import 'package:maxopen_task/features/home_screen/domain/data_source/top_five_remote_data_source.dart';
import 'package:maxopen_task/features/home_screen/domain/models/movies.dart';
import 'package:maxopen_task/features/home_screen/domain/repository/top_five_repository.dart';

class TopFiveRepositoryImpl implements TopFiveRepository {
  final TopFiveRemoteDataSource _topFiveRemoteDataSource;

  TopFiveRepositoryImpl(this._topFiveRemoteDataSource);
  @override
  Future<List<Movie>> getTopFiveMovies(String locale) async {
    try {
      final resultClient =
          await _topFiveRemoteDataSource.getTopFiveMovies(locale);
      return resultClient;
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }
}
