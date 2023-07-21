import 'package:picture_of_the_day/domain/entities/picture_entity.dart';

abstract class PictureRemoteRepository {
  Future<List<PictureEntity>> fetchImages();
}
