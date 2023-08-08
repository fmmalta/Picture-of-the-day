import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:picture_of_the_day/core/http/http_service.dart';
import 'package:picture_of_the_day/data/datasource/picture_data_source.dart';
import 'package:picture_of_the_day/data/repository/picture_repository_impl.dart';
import 'package:picture_of_the_day/domain/repository/picture_repository.dart';
import 'package:picture_of_the_day/domain/use_case/clear_stored_pictures_usecase.dart';
import 'package:picture_of_the_day/domain/use_case/fetch_image_usecase.dart';
import 'package:picture_of_the_day/domain/use_case/retrieve_latest_pictures_list_usecase.dart';
import 'package:picture_of_the_day/domain/use_case/store_latest_picture_usecase.dart';
import 'package:shared_preferences/shared_preferences.dart';

GetIt serviceLocator = GetIt.instance;

Future<void> initInjection() async {
  SharedPreferences sharedPref = await SharedPreferences.getInstance();
  serviceLocator.registerSingleton<SharedPreferences>(sharedPref);

  serviceLocator.registerLazySingleton<Dio>(() => Dio());

  serviceLocator.registerLazySingleton(
    () => HttpService(serviceLocator<Dio>()),
  );

  serviceLocator.registerLazySingleton(() => PictureDataSource(
      sharedPreferences: serviceLocator<SharedPreferences>(),
      httpService: serviceLocator<HttpService>()));

  serviceLocator.registerLazySingleton<PictureRepository>(
    () => PictureRepositoryImpl(serviceLocator<PictureDataSource>()),
  );

  serviceLocator.registerLazySingleton(
      () => StoreLatestPictureUseCase(serviceLocator<PictureRepository>()));

  serviceLocator.registerLazySingleton(() =>
      RetrieveLatestPicturesListUseCase(serviceLocator<PictureRepository>()));

  serviceLocator.registerLazySingleton(
      () => FetchImageUseCase(serviceLocator<PictureRepository>()));

  serviceLocator.registerLazySingleton(
      () => ClearStoredPicturesUseCase(serviceLocator<PictureRepository>()));
}
