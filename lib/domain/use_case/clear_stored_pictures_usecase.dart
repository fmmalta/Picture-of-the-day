import 'package:picture_of_the_day/core/usecase/usecase.dart';
import 'package:picture_of_the_day/domain/repository/picture_repository.dart';

class ClearStoredPicturesUseCase implements UseCase<bool, void> {
  final PictureRepository _pictureRepository;

  ClearStoredPicturesUseCase(this._pictureRepository);

  @override
  Future<bool> call({params}) {
    return _pictureRepository.clearStoredPictures();
  }
}
