import 'package:maxopen_task/features/genres/domain/model/genres_model.dart';

abstract class GenresRemoteDataSource {
  Future<List<GenresModel>> getGenres(String locale);
}
