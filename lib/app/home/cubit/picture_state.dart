part of 'picture_cubit.dart';

@immutable
abstract class PictureState extends Equatable {
  @override
  List<Object?> get props => [];
}

class PictureInitial extends PictureState {}

class LoadingImageState extends PictureState {}

class ImageRetrievedState extends PictureState {
  final List<PictureEntity> pictures;

  ImageRetrievedState(this.pictures);
}

class ImageRetrieveErrorState extends PictureState {
  final String message;

  ImageRetrieveErrorState(this.message);

  @override
  List<Object?> get props => [message];
}
