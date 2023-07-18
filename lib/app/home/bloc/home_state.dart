part of 'home_bloc.dart';

@immutable
abstract class HomeState {}

class HomeInitial extends HomeState {}

class LoadingImageState extends HomeState {}

class ImageRetrivedState extends HomeState {
  final PictureEntity picture;

  ImageRetrivedState(this.picture);
}
