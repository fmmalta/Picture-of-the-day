import 'dart:convert';

import 'package:picture_of_the_day/domain/entities/picture_entity.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PictureLocalDataSource {
  final SharedPreferences sharedPreferences;

  PictureLocalDataSource(this.sharedPreferences);

  final _pictureKey = '__#PictureKey#__';

  Future<bool> clearStoredPictures() async {
    return sharedPreferences.clear();
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
