import 'package:maxopen_task/features/genres/domain/model/genres_model.dart';

abstract class GenresRepository {
  Future<List<GenresModel>> getGenres(String locale);
}
