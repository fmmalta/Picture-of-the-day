import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:picture_of_the_day/core/http/http_service.dart';
import 'package:picture_of_the_day/data/picture_repository_impl/picture_local_repository_impl.dart';
import 'package:picture_of_the_day/data/picture_repository_impl/picture_remote_repository_impl.dart';
import 'package:picture_of_the_day/data/use_case/picture_retriever_use_case.dart';
import 'package:picture_of_the_day/domain/picture_repository/picture_local_repository.dart';
import 'package:picture_of_the_day/domain/picture_repository/picture_remote_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt serviceLocator = GetIt.instance;

Future<void> initInjection() async {
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  serviceLocator.registerSingleton<SharedPreferences>(sharedPref);

  serviceLocator.registerLazySingleton<Dio>(() => Dio());

  serviceLocator.registerLazySingleton(
    () => HttpService(serviceLocator<Dio>()),
  );

  serviceLocator.registerLazySingleton<PictureLocalRepository>(
    () => LocalRepositoryImpl(serviceLocator<SharedPreferences>()),
  );
  serviceLocator.registerLazySingleton<PictureRemoteRepository>(
    () => RemoteRepositoryImpl(serviceLocator<HttpService>()),
  );

  serviceLocator.registerLazySingleton(() => PictureRetrieverUseCase(
        localRepository: serviceLocator<PictureLocalRepository>(),
        remoteRepository: serviceLocator<PictureRemoteRepository>(),
      ));
}
