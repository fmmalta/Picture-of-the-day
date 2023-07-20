import 'dart:convert';

import 'package:picture_of_the_day/domain/entities/picture_entity.dart';
import 'package:picture_of_the_day/domain/repository/local_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalRepositoryImpl implements LocalRepository {
  final SharedPreferences sharedPreferences;

  LocalRepositoryImpl(this.sharedPreferences);

  final _pictureKey = '__#PictureKey#__';
  @override
  Future<PictureEntity?> retrieveLastestImage() async {
    if (sharedPreferences.containsKey(_pictureKey)) {
      final result = sharedPreferences.getString(_pictureKey) as String;
      final decode = json.decode(result);
      return PictureEntity.fromJson(decode);
    } else {
      return null;
    }
  }

  @override
  Future<bool> storeLastestImage(PictureEntity picture) async {
    return sharedPreferences.setString(
      _pictureKey,
      json.encode(picture.toJson()),
    );
  }
}
