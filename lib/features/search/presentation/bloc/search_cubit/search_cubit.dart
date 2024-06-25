import 'package:bloc/bloc.dart';
import 'package:maxopen_task/features/home_screen/domain/models/movies.dart';
import 'package:maxopen_task/features/search/domain/repository/search_repository.dart';
import 'package:meta/meta.dart';

part 'search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  final SearchRepository _searchRepository;
  SearchCubit(this._searchRepository) : super(SearchInitial());

  Future<void> searchMovie(String query) async {
    // emit(ClientListLoading());
    List<Movie> result = await _searchRepository.getSearchMovies(query);
    emit(SearchLoaded(movie: result));
  }
}
