import 'package:picture_of_the_day/core/usecase/usecase.dart';
import 'package:picture_of_the_day/domain/entities/picture_entity.dart';
import 'package:picture_of_the_day/domain/repository/picture_repository.dart';

class FetchImageUseCase implements UseCase<List<PictureEntity>, void> {
  final PictureRepository _pictureRepository;

  FetchImageUseCase(this._pictureRepository);

  @override
  Future<List<PictureEntity>> call({params}) async {
    return _pictureRepository.fetchImages();
  }
}
