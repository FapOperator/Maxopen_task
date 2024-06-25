import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:maxopen_task/core/api_client.dart';
import 'package:maxopen_task/features/genres/data/data_source/genres_remote_data_source_impl.dart';
import 'package:maxopen_task/features/genres/data/repository/genres_repository_impl.dart';
import 'package:maxopen_task/features/genres/domain/data_source/genres_remote_data_source.dart';
import 'package:maxopen_task/features/genres/domain/repository/genres_repository.dart';
import 'package:maxopen_task/features/home_screen/data/data_source/now_playing_remote_data_source_impl.dart';
import 'package:maxopen_task/features/home_screen/data/data_source/top_five_remote_data_source_impl.dart';
import 'package:maxopen_task/features/home_screen/data/repository/now_playing_repository_impl.dart';
import 'package:maxopen_task/features/home_screen/data/repository/top_five_repository_impl.dart';
import 'package:maxopen_task/features/home_screen/domain/data_source/now_playing_remote_data_source.dart';
import 'package:maxopen_task/features/home_screen/domain/data_source/top_five_remote_data_source.dart';
import 'package:maxopen_task/features/home_screen/domain/repository/now_playing_repository.dart';
import 'package:maxopen_task/features/home_screen/domain/repository/top_five_repository.dart';
import 'package:maxopen_task/features/home_screen/presentation/bloc/genres_cubit/genres_cubit.dart';
import 'package:maxopen_task/features/home_screen/presentation/bloc/latest_cubit/latest_cubit.dart';
import 'package:maxopen_task/features/home_screen/presentation/bloc/top_five/top_five_cubit.dart';
import 'package:maxopen_task/features/home_screen/presentation/screen/movie_detail/favourite/favourite_cubit.dart';
import 'package:maxopen_task/features/bookmarks/local_db/favourite_manager.dart';
import 'package:maxopen_task/features/search/data/data_source/search_remote_data_source_impl.dart';
import 'package:maxopen_task/features/search/data/repository/search_repository_impl.dart';
import 'package:maxopen_task/features/search/domain/data_source/search_remote_data_source.dart';
import 'package:maxopen_task/features/search/domain/repository/search_repository.dart';
import 'package:maxopen_task/features/search/presentation/bloc/search_cubit/search_cubit.dart';

final getIt = GetIt.I;

Future init() async {
  // getIt.registerLazySingleton<SessionDataProvider>(() => SessionDataProvider());
  // getIt.registerSingletonAsync<FavouriteManager>(() async {
  //   final pref = await SharedPreferences.getInstance();
  //   return FavouriteManager(pref);
  // }, signalsReady: false);
  // await getIt.getAsync<FavouriteManager>();
  getIt.registerLazySingleton<FavouriteManager>(() => FavouriteManager());
  getIt.registerLazySingleton<Client>(() => Client());
  getIt.registerLazySingleton<ApiClient>(() => ApiClient(getIt()));

  getIt.registerLazySingleton<TopFiveRepository>(
      () => TopFiveRepositoryImpl(getIt()));

  getIt.registerLazySingleton<TopFiveRemoteDataSource>(
      () => TopFiveRemoteDataSourceImpl(getIt()));

  getIt.registerFactory<TopFiveCubit>(() => TopFiveCubit(getIt()));

  getIt.registerLazySingleton<NowPlayingRepository>(
      () => NowPlayingRepositoryImpl(getIt()));

  getIt.registerLazySingleton<NowPlayingRemoteDataSource>(
      () => NowPlayingRemoteDataSourceImpl(getIt()));

  getIt.registerFactory<LatestCubit>(() => LatestCubit(getIt()));

  getIt.registerLazySingleton<GenresRepository>(
      () => GenresRepositoryImpl(getIt()));

  getIt.registerLazySingleton<GenresRemoteDataSource>(
      () => GenresRemoteDataSourceImpl(getIt()));

  getIt.registerFactory<GenresCubit>(() => GenresCubit(getIt()));

  getIt.registerLazySingleton<SearchRepository>(
      () => SearchRepositoryImpl(getIt()));

  getIt.registerLazySingleton<SearchRemoteDataSource>(
      () => SearchRemoteDataSourceImpl(getIt()));

  getIt.registerFactory<SearchCubit>(() => SearchCubit(getIt()));

  getIt.registerFactory<FavouriteCubit>(() => FavouriteCubit(getIt()));
}
