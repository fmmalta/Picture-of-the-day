import 'package:picture_of_the_day/core/usecase/usecase.dart';
import 'package:picture_of_the_day/domain/entities/picture_entity.dart';
import 'package:picture_of_the_day/domain/repository/picture_repository.dart';

class RetrieveLatestPicturesListUseCase
    implements UseCase<List<PictureEntity>, void> {
  final PictureRepository pictureRepository;

  RetrieveLatestPicturesListUseCase(this.pictureRepository);

  @override
  Future<List<PictureEntity>> call({params}) async {
    return pictureRepository.retrieveLatestPicturesList();
  }
}
