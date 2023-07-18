import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:picture_of_the_day/data/service/picture_retriever_service.dart';
import 'package:picture_of_the_day/domain/entities/picture_entity.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final PictureRetrieverService pictureRetrieverService;

  HomeBloc(this.pictureRetrieverService) : super(HomeInitial()) {
    on<RetrieveImageEvent>(_retrieveImage);
  }

  Future<void> _retrieveImage(HomeEvent event, Emitter<HomeState> emit) async {
    emit(LoadingImageState());
    final picture = await pictureRetrieverService.fetchImage();
    emit(ImageRetrivedState(picture));
  }
}
