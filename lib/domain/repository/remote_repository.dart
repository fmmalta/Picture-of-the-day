import 'package:picture_of_the_day/domain/entities/picture_entity.dart';

abstract class RemoteRepository {
  Future<PictureEntity> fetchImage();
}
