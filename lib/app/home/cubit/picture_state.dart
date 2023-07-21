part of 'picture_cubit.dart';

@immutable
abstract class PictureState {}

class PictureInitial extends PictureState {}

class LoadingImageState extends PictureState {}

class ImageRetrievedState extends PictureState {
  final List<PictureEntity> pictures;

  ImageRetrievedState(this.pictures);
}
