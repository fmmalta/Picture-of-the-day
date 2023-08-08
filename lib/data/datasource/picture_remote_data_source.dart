import 'package:picture_of_the_day/core/http/http_service.dart';
import 'package:picture_of_the_day/domain/entities/picture_entity.dart';

class PictureRemoteDataSource {
  final HttpService httpService;

  PictureRemoteDataSource(this.httpService);

  Future<List<PictureEntity>> fetchImages() async {
    List<PictureEntity> pictureList = [];
    const String defaultUrl = 'https://api.nasa.gov/planetary/apod?api_key=';
    const String apiKey = 'oVyQqfbj4mi1ljYRGktH4ggADkidGgD8mysuf4xU';
    final DateTime startDate =
        DateTime.now().subtract(const Duration(days: 20));
    final DateTime endDate = DateTime.now();

    final String rangeDate =
        'start_date=${startDate.year}-${startDate.month}-${startDate.day}&end_date=${endDate.year}-${endDate.month}-${endDate.day}';
    try {
      final response = await httpService.get('$defaultUrl$apiKey&$rangeDate');
      final rawPictureList = List<dynamic>.from(response.data);
      for (dynamic rawPicture in rawPictureList) {
        pictureList.add(PictureEntity.fromJson(rawPicture));
      }
      return pictureList;
    } catch (error) {
      rethrow;
    }
  }
}
