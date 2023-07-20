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
    final localPicture = await localRepository.retrieveLastestImage();
    if (localPicture != null) {
      return localPicture;
    } else {
      final remotePicture = await remoteRepository.fetchImage();
      await localRepository.storeLastestImage(remotePicture);
      return remotePicture;
    }
  }
}
