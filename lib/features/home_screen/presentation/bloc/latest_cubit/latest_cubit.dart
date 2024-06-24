import 'package:bloc/bloc.dart';
import 'package:maxopen_task/features/genres/domain/model/genres_model.dart';
import 'package:maxopen_task/features/genres/domain/repository/genres_repository.dart';
import 'package:maxopen_task/features/home_screen/domain/models/movies.dart';
import 'package:maxopen_task/features/home_screen/domain/repository/now_playing_repository.dart';
import 'package:meta/meta.dart';

part 'latest_state.dart';

class LatestCubit extends Cubit<LatestState> {
  final NowPlayingRepository _nowPlayingRepository;
  final GenresRepository _genresRepository;
  LatestCubit(this._nowPlayingRepository, this._genresRepository)
      : super(LatestInitial());

  Future<void> getTopFiveMovie() async {
    // emit(ClientListLoading());
    List<Movie> result = await _nowPlayingRepository.getNowPlayingMovies();
    List<GenresModel> genres = await _genresRepository.getGenres();
    emit(LatestLoaded(movieModel: result, genresModel: genres));
  }
}
