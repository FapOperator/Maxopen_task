import 'package:bloc/bloc.dart';
import 'package:maxopen_task/features/home_screen/domain/models/movies.dart';
import 'package:maxopen_task/features/home_screen/domain/repository/top_five_repository.dart';
import 'package:meta/meta.dart';

part 'top_five_state.dart';

class TopFiveCubit extends Cubit<TopFiveState> {
  final TopFiveRepository _topFiveRepository;
  TopFiveCubit(this._topFiveRepository) : super(TopFiveInitial());

  Future<void> getTopFiveMovie(String locale) async {
    List<Movie> result = await _topFiveRepository.getTopFiveMovies(locale);
    emit(TopFiveLoaded(movieModel: result));
  }
}
