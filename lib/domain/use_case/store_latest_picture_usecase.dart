import 'package:picture_of_the_day/core/usecase/usecase.dart';
import 'package:picture_of_the_day/domain/entities/picture_entity.dart';
import 'package:picture_of_the_day/domain/repository/picture_repository.dart';

class StoreLatestPictureUseCase implements UseCase<bool, List<PictureEntity>> {
  final PictureRepository repository;

  StoreLatestPictureUseCase(this.repository);

  @override
  Future<bool> call({List<PictureEntity>? params}) {
    return repository.storeLatestPictureList(params!);
  }
}
