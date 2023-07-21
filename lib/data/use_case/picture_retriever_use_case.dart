import 'package:picture_of_the_day/domain/entities/picture_entity.dart';
import 'package:picture_of_the_day/domain/picture_repository/picture_local_repository.dart';
import 'package:picture_of_the_day/domain/picture_repository/picture_remote_repository.dart';

class PictureRetrieverUseCase {
  final PictureLocalRepository localRepository;
  final PictureRemoteRepository remoteRepository;

  PictureRetrieverUseCase({
    required this.localRepository,
    required this.remoteRepository,
  });

  Future<List<PictureEntity>> fetchImage() async {
    final localPictures = await localRepository.retrieveLatestPicturesList();
    if (localPictures.isNotEmpty) {
      return localPictures;
    } else {
      final remotePictures = await remoteRepository.fetchImages();
      await localRepository.storeLatestPictureList(remotePictures);
      return remotePictures;
    }
  }

  Future<List<PictureEntity>> remoteFetchImage() async {
    try {
      return await remoteRepository.fetchImages();
    } catch (error) {
      return await localRepository.retrieveLatestPicturesList();
    }
  }
}
