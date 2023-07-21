import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:picture_of_the_day/data/use_case/picture_retriever_use_case.dart';
import 'package:picture_of_the_day/domain/entities/picture_entity.dart';

part 'picture_state.dart';

class PictureCubit extends Cubit<PictureState> {
  final PictureRetrieverUseCase pictureUseCase;

  PictureCubit(this.pictureUseCase) : super(PictureInitial());

  Future<void> retrieveImage() async {
    emit(LoadingImageState());
    final pictures = await pictureUseCase.fetchImage();
    emit(ImageRetrievedState(pictures));
  }

  Future<void> forcedImageRefresh() async {
    emit(LoadingImageState());
    final pictures = await pictureUseCase.remoteFetchImage();
    emit(ImageRetrievedState(pictures));
  }
}
