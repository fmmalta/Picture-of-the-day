import 'package:picture_of_the_day/data/datasource/picture_local_data_source.dart';
import 'package:picture_of_the_day/data/datasource/picture_remote_data_source.dart';
import 'package:picture_of_the_day/domain/entities/picture_entity.dart';
import 'package:picture_of_the_day/domain/repository/picture_repository.dart';

class PictureRepositoryImpl implements PictureRepository {
  final PictureLocalDataSource _dataSource;
  final PictureRemoteDataSource _remoteDataSource;

  PictureRepositoryImpl(this._dataSource, this._remoteDataSource);

  @override
  Future<bool> clearStoredPictures() async {
    return _dataSource.clearStoredPictures();
  }

  @override
  Future<List<PictureEntity>> fetchImages() async {
    return _remoteDataSource.fetchImages();
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
