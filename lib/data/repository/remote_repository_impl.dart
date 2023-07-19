import 'dart:convert';

import 'package:picture_of_the_day/core/http/http_service.dart';

import 'package:picture_of_the_day/domain/entities/picture_entity.dart';
import 'package:picture_of_the_day/domain/repository/remote_repository.dart';

class RemoteRepositoryImpl implements RemoteRepository {
  final HttpService httpService;

  RemoteRepositoryImpl(this.httpService);

  @override
  Future<PictureEntity> fetchImage() async {
    const String defaultUrl = 'https://api.nasa.gov/planetary/apod?api_key=';
    const String apiKey = 'oVyQqfbj4mi1ljYRGktH4ggADkidGgD8mysuf4xU';
    try {
      final response = await httpService.get('$defaultUrl$apiKey');

      final result = json.decode(response.data);
      return PictureEntity.fromJson(result);
    } catch (error) {
      throw Exception();
    }
  }
}
