import 'package:picture_of_the_day/domain/entities/picture_entity.dart';

class PictureModel {
  final String url;
  final String explanation;
  final String title;
  final DateTime date;

  PictureModel({
    required this.url,
    required this.explanation,
    required this.title,
    required this.date,
  });

  factory PictureModel.fromJson(Map<String, dynamic> json) {
    return PictureModel(
        url: json['url'] ?? '',
        explanation: json['explanation'] ?? '',
        title: json['title'] ?? '',
        date: json['date'] == null
            ? DateTime.now()
            : DateTime.parse(json['date']));
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'url': url,
      'explanation': explanation,
      'title': title,
      'date': date.toIso8601String(),
    };
  }

  PictureEntity toEntity() => PictureEntity(
        url: url,
        explanation: explanation,
        title: title,
        date: date,
      );
}
