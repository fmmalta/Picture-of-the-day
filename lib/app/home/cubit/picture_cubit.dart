import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:picture_of_the_day/domain/entities/picture_entity.dart';
import 'package:picture_of_the_day/domain/use_case/fetch_image_usecase.dart';
import 'package:picture_of_the_day/domain/use_case/retrieve_latest_pictures_list_usecase.dart';
import 'package:picture_of_the_day/domain/use_case/store_latest_picture_usecase.dart';

part 'picture_state.dart';

class PictureCubit extends Cubit<PictureState> {
  final FetchImageUseCase fetchImageUseCase;
  final RetrieveLatestPicturesListUseCase retrieveLatestPicturesListUseCase;
  final StoreLatestPictureUseCase storeLatestPictureUseCase;

  PictureCubit({
    required this.fetchImageUseCase,
    required this.retrieveLatestPicturesListUseCase,
    required this.storeLatestPictureUseCase,
  }) : super(PictureInitial());

  Future<void> retrieveImage() async {
    try {
      emit(LoadingImageState());
      final localPictures = await retrieveLatestPicturesListUseCase();
      if (localPictures.isEmpty) {
        final pictures = await fetchImageUseCase();
        storeLatestPictureUseCase(params: pictures);
        emit(ImageRetrievedState(pictures));
      } else {
        emit(ImageRetrievedState(localPictures));
      }
    } catch (error) {
      emit(ImageRetrieveErrorState(error.toString()));
    }
  }

  Future<void> forcedImageRefresh() async {
    try {
      emit(LoadingImageState());
      final pictures = await fetchImageUseCase();
      emit(ImageRetrievedState(pictures));
    } catch (error) {
      emit(ImageRetrieveErrorState(error.toString()));
    }
  }
}
