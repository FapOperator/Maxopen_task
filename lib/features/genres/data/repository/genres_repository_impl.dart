import 'package:maxopen_task/core/exeption.dart';
import 'package:maxopen_task/features/genres/domain/data_source/genres_remote_data_source.dart';
import 'package:maxopen_task/features/genres/domain/model/genres_model.dart';
import 'package:maxopen_task/features/genres/domain/repository/genres_repository.dart';

class GenresRepositoryImpl implements GenresRepository {
  final GenresRemoteDataSource _genresRemoteDataSource;

  GenresRepositoryImpl(this._genresRemoteDataSource);
  @override
  Future<List<GenresModel>> getGenres(String locale) async {
    try {
      final resultClient = await _genresRemoteDataSource.getGenres(locale);
      return resultClient;
    } on ServerException catch (error) {
      throw Exception(error);
    }
  }
}
