import 'package:maxopen_task/features/genres/domain/model/genres_model.dart';

class GenresFunction {
  List<String> computeGenres(
      List<int> genresId, List<GenresModel> genresModel) {
    List<String> genresString = [];
    genresModel.map((singleGenres) {
      genresId.map((singleId) {
        if (singleGenres.id == singleId) {
          genresString.add(singleGenres.name);
        }
      }).toList();
    }).toList();
    return genresString;
  }
}
