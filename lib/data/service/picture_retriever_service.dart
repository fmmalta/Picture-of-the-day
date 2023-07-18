import 'package:picture_of_the_day/domain/entities/picture_entity.dart';
import 'package:picture_of_the_day/domain/repository/local_repository.dart';
import 'package:picture_of_the_day/domain/repository/remote_repository.dart';

class PictureRetrieverService {
  final LocalRepository localRepository;
  final RemoteRepository remoteRepository;

  PictureRetrieverService({
    required this.localRepository,
    required this.remoteRepository,
  });

  Future<PictureEntity> fetchImage() async {
    try {
      return await remoteRepository.fetchImage();
    } catch (error) {
      return localRepository.retrieveLastestImage();
    }
  }
}
