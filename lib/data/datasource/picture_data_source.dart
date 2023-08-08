import 'dart:convert';

import 'package:picture_of_the_day/core/http/http_service.dart';
import 'package:picture_of_the_day/domain/entities/picture_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PictureDataSource {
  final SharedPreferences sharedPreferences;
  final HttpService httpService;

  PictureDataSource(
      {required this.sharedPreferences, required this.httpService});

  final _pictureKey = '__#PictureKey#__';

  Future<bool> clearStoredPictures() async {
    return sharedPreferences.clear();
  }

  Future<List<PictureEntity>> fetchImages() async {
    List<PictureEntity> pictureList = [];
    const String defaultUrl = 'https://api.nasa.gov/planetary/apod?api_key=';
    const String apiKey = 'oVyQqfbj4mi1ljYRGktH4ggADkidGgD8mysuf4xU';
    final DateTime startDate = DateTime(2023, 7, 1);
    final DateTime endDate = DateTime.now();

    final String rangeDate =
        'start_date=${startDate.year}-${startDate.month}-${startDate.day}&end_date=${endDate.year}-${endDate.month}-${endDate.day}';
    try {
      final response = await httpService.get('$defaultUrl$apiKey&$rangeDate');
      final rawPictureList = List<dynamic>.from(response.data);
      for (dynamic rawPicture in rawPictureList) {
        pictureList.add(PictureEntity.fromJson(rawPicture));
      }
      return pictureList;
    } catch (error) {
      rethrow;
    }
  }

  Future<List<PictureEntity>> retrieveLatestPicturesList() async {
    if (sharedPreferences.containsKey(_pictureKey)) {
      final List<PictureEntity> pictures = [];
      final result = sharedPreferences.getString(_pictureKey) as String;
      final List<dynamic> decodedPicturesList = json.decode(result);
      for (dynamic picture in decodedPicturesList) {
        pictures.add(PictureEntity.fromJson(picture));
      }
      return pictures;
    } else {
      return [];
    }
  }

  Future<bool> storeLatestPictureList(List<PictureEntity> pictures) async {
    return sharedPreferences.setString(
      _pictureKey,
      json.encode(pictures),
    );
  }
}
