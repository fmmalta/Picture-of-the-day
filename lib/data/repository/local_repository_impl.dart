import 'package:picture_of_the_day/domain/entities/picture_entity.dart';
import 'package:picture_of_the_day/domain/repository/local_repository.dart';

class LocalRepositoryImpl implements LocalRepository {
  @override
  Future<PictureEntity> retrieveLastestImage() {
    // TODO: implement retrieveLastestImage
    throw UnimplementedError();
  }

  @override
  Future<bool> storeLastestImage() {
    // TODO: implement storeLastestImage
    throw UnimplementedError();
  }
}
