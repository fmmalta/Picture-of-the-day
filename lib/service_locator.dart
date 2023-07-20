import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:picture_of_the_day/core/http/http_service.dart';
import 'package:picture_of_the_day/data/repository/local_repository_impl.dart';
import 'package:picture_of_the_day/data/repository/remote_repository_impl.dart';
import 'package:picture_of_the_day/data/service/picture_retriever_service.dart';
import 'package:picture_of_the_day/domain/repository/local_repository.dart';
import 'package:picture_of_the_day/domain/repository/remote_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt serviceLocator = GetIt.instance;

Future<void> initInjection() async {
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  serviceLocator.registerSingleton<SharedPreferences>(sharedPref);

  serviceLocator.registerLazySingleton<Dio>(() => Dio());

  serviceLocator.registerLazySingleton(
    () => HttpService(serviceLocator<Dio>()),
  );

  serviceLocator.registerLazySingleton<LocalRepository>(
    () => LocalRepositoryImpl(serviceLocator<SharedPreferences>()),
  );
  serviceLocator.registerLazySingleton<RemoteRepository>(
    () => RemoteRepositoryImpl(serviceLocator<HttpService>()),
  );

  serviceLocator.registerLazySingleton(() => PictureRetrieverService(
        localRepository: serviceLocator<LocalRepository>(),
        remoteRepository: serviceLocator<RemoteRepository>(),
      ));
}
