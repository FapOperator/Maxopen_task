import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:maxopen_task/application/loading/loading_cubit.dart';
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
import 'package:maxopen_task/features/home_screen/presentation/bloc/latest_cubit/latest_cubit.dart';
import 'package:maxopen_task/features/home_screen/presentation/bloc/top_five/top_five_cubit.dart';
import 'package:maxopen_task/infostructure/session_data_provider/local_storage_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.I;

Future init() async {
  // getIt.registerLazySingleton<SessionDataProvider>(() => SessionDataProvider());
  getIt.registerSingletonAsync<LocalStorageService>(() async {
    final pref = await SharedPreferences.getInstance();
    return LocalStorageService(pref);
  }, signalsReady: false);
  await getIt.getAsync<LocalStorageService>();
  getIt.registerSingleton<LoadingCubit>(LoadingCubit());
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

  getIt.registerFactory<LatestCubit>(() => LatestCubit(getIt(), getIt()));

  getIt.registerLazySingleton<GenresRepository>(
      () => GenresRepositoryImpl(getIt()));

  getIt.registerLazySingleton<GenresRemoteDataSource>(
      () => GenresRemoteDataSourceImpl(getIt()));
}
