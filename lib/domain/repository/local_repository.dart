import 'package:picture_of_the_day/domain/entities/picture_entity.dart';

abstract class LocalRepository {
  Future<bool> storeLastestImage();

  Future<PictureEntity> retrieveLastestImage();
}
