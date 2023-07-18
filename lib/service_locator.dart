import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:picture_of_the_day/core/http/http_service.dart';
import 'package:picture_of_the_day/data/repository/local_repository_impl.dart';
import 'package:picture_of_the_day/data/repository/remote_repository_impl.dart';
import 'package:picture_of_the_day/domain/repository/local_repository.dart';
import 'package:picture_of_the_day/domain/repository/remote_repository.dart';

GetIt serviceLocator = GetIt.instance;

Future<void> initInjection() async {
  serviceLocator.registerLazySingleton<Dio>(() => Dio());
  serviceLocator
      .registerLazySingleton(() => HttpService(serviceLocator<Dio>()));
  serviceLocator
      .registerLazySingleton<LocalRepository>(() => LocalRepositoryImpl());
  serviceLocator.registerLazySingleton<RemoteRepository>(
      () => RemoteRepositoryImpl(serviceLocator<HttpService>()));
}
