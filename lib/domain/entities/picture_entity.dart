class PictureEntity {
  final String url;
  final String explanation;
  final String title;

  PictureEntity({
    required this.url,
    required this.explanation,
    required this.title,
  });

  factory PictureEntity.fromJson(Map<String, dynamic> json) {
    return PictureEntity(
      url: json['url'],
      explanation: json['explanation'],
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'url': url,
      'explanation': explanation,
      'title': title,
    };
  }
}
