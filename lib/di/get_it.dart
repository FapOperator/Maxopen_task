import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:maxopen_task/application/loading/loading_cubit.dart';
import 'package:maxopen_task/domain/core/api_client.dart';
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

  // getIt.registerLazySingleton<LoginRepo>(() => LoginRepoImpl(getIt()));

  // getIt.registerLazySingleton<LoginRemoteDataSource>(
  //     () => ImplLoginRemoteDataSource(getIt()));

  // getIt.registerFactory<LoaderCubit>(() => LoaderCubit(getIt(), getIt()));

  // getIt.registerLazySingleton<CheckAuthBloc>(() => CheckAuthBloc(getIt()));

  // getIt.registerFactory<LoginCubit>(() => LoginCubit(getIt(), getIt()));

  // getIt.registerLazySingleton<GetClientRepo>(() => GetClientRepoImpl(getIt()));

  // getIt.registerLazySingleton<GetClientRemoteDataSource>(
  //     () => ImplGetClientRemoteDataSource(getIt()));

  // getIt.registerLazySingleton<ClientListCubit>(() => ClientListCubit(getIt()));

  // getIt.registerLazySingleton<RequestRepo>(
  //     () => RequestRepoImpl(getIt(), getIt()));

  // getIt.registerLazySingleton<RequestRemoteDataSource>(
  //     () => ImplRequestRemoteDataSource(getIt()));

  // getIt.registerLazySingleton<AddRequestCubit>(
  //     () => AddRequestCubit(getIt(), getIt()));

  // getIt.registerFactory<RequestGetOrUpdateCubit>(
  //     () => RequestGetOrUpdateCubit(getIt()));

  // getIt.registerLazySingleton<PickerPhotoBloc>(() => PickerPhotoBloc());
}
