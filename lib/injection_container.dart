import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http_interceptor/http/intercepted_client.dart';
import 'package:socially/core/bloc/timer/timer_cubit.dart';
import 'package:socially/core/network/api.dart';
import 'package:socially/core/network/interceptors/api_interceptor.dart';
import 'package:socially/core/network/interceptors/custom_retry_policy.dart';
import 'package:socially/core/network/network_info.dart';
import 'package:socially/core/repositories/repository_handler.dart';
import 'package:socially/features/home/data/data_sources/home_page_remote_data_source.dart';
import 'package:socially/features/home/data/repositories/home_page_repository_impl.dart';
import 'package:socially/features/home/domain/repositories/home_page_repository.dart';
import 'package:socially/features/home/domain/usecases/fetch_posts.dart';
import 'package:socially/features/home/presentation/bloc/posts_bloc/posts_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  _initHome();
  await _initCoreAndExternals();
}

void _initHome() {
  //bloc
  sl.registerFactory(() => PostsBloc(fetchPosts: sl()));

  //usecases
  sl.registerLazySingleton(() => FetchPosts(homePageRepository: sl()));

  //repositories
  sl.registerLazySingleton<HomePageRepository>(() => HomePageRepositoryImpl(
        repositoryHandler: sl(),
        homePageRemoteDataSource: sl(),
      ));

  //data sources
  sl.registerLazySingleton<HomePageRemoteDataSource>(
      () => HomePageRemoteDataSourceImpl(api: sl()));
}

Future<void> _initCoreAndExternals() async {
  //Core
  sl.registerFactory(() => TimerCubit());
  sl.registerLazySingleton<RepositoryHandler>(() => RepositoryHandlerImpl());
  sl.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImpl(connectivity: sl()));
  sl.registerLazySingleton<Api>(() => ApiImpl(client: sl(), networkInfo: sl()));

  //*********************************************
  //Externals

  sl.registerLazySingleton(() => Connectivity());

  sl.registerLazySingleton(
    () => InterceptedClient.build(
      interceptors: [ApiInterceptor()],
      retryPolicy: CustomRetryPolicy(),
    ),
  );
}
