import 'package:bloc/bloc.dart';
import 'package:maxopen_task/features/genres/domain/model/genres_model.dart';
import 'package:maxopen_task/features/genres/domain/repository/genres_repository.dart';
import 'package:meta/meta.dart';

part 'genres_state.dart';

class GenresCubit extends Cubit<GenresState> {
  final GenresRepository _genresRepository;
  GenresCubit(this._genresRepository) : super(GenresInitial());

  Future<void> getGenres(String locale) async {
    // emit(ClientListLoading());
    List<GenresModel> result = await _genresRepository.getGenres(locale);
    emit(GenresLoaded(genresModel: result));
  }
}
