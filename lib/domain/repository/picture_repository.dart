import 'package:picture_of_the_day/domain/entities/picture_entity.dart';

abstract class PictureRepository {
  Future<bool> storeLatestPictureList(List<PictureEntity> pictures);

  Future<List<PictureEntity>> retrieveLatestPicturesList();

  Future<bool> clearStoredPictures();

  Future<List<PictureEntity>> fetchImages();
}
