import 'package:picture_of_the_day/domain/entities/picture_entity.dart';

abstract class PictureLocalRepository {
  Future<bool> storeLatestPictureList(List<PictureEntity> pictures);

  Future<List<PictureEntity>> retrieveLatestPicturesList();

  Future<bool> clearStoredPictures();
}
