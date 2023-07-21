class PictureEntity {
  final String url;
  final String explanation;
  final String title;
  final DateTime date;

  PictureEntity({
    required this.url,
    required this.explanation,
    required this.title,
    required this.date,
  });

  factory PictureEntity.fromJson(Map<String, dynamic> json) {
    return PictureEntity(
        url: json['url'],
        explanation: json['explanation'],
        title: json['title'],
        date: DateTime.parse(json['date']));
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'url': url,
      'explanation': explanation,
      'title': title,
      'date': date.toIso8601String(),
    };
  }
}
