import 'package:picture_of_the_day/data/datasource/picture_data_source.dart';
import 'package:picture_of_the_day/domain/entities/picture_entity.dart';
import 'package:picture_of_the_day/domain/repository/picture_repository.dart';

class PictureRepositoryImpl implements PictureRepository {
  final PictureDataSource _dataSource;

  PictureRepositoryImpl(this._dataSource);

  @override
  Future<bool> clearStoredPictures() async {
    return _dataSource.clearStoredPictures();
  }

  @override
  Future<List<PictureEntity>> fetchImages() async {
    return _dataSource.fetchImages();
  }

  @override
  Future<List<PictureEntity>> retrieveLatestPicturesList() async {
    return _dataSource.retrieveLatestPicturesList();
  }

  @override
  Future<bool> storeLatestPictureList(List<PictureEntity> pictures) async {
    return _dataSource.storeLatestPictureList(pictures);
  }
}
