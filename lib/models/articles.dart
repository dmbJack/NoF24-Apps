class Articles {
  final String title;
  final String description;
  final String content;
  final String url;
  final String image;
  final String publishedAt;
  final Map sources;
  Articles(
      {required this.title,
      required this.description,
      required this.content,
      required this.url,
      required this.image,
      required this.publishedAt,
      required this.sources});

  Articles copyWith(
      {String? title,
      String? description,
      String? content,
      String? url,
      String? image,
      String? publishedAt,
      Map? sources}) {
    return Articles(
        title: title ?? this.title,
        description: description ?? this.description,
        content: content ?? this.content,
        url: url ?? this.url,
        image: image ?? this.image,
        publishedAt: publishedAt ?? this.publishedAt,
        sources: sources ?? this.sources);
  }

  factory Articles.fromJson(Map<String, dynamic> map) {
    return Articles(
        title: map['title'],
        description: map['description'],
        content: map['content'] ,
        url: map['url'] ,
        image: map['image'] ,
        publishedAt: map['publishedAt'],
        sources: map['source']);
  }

  String get nameSources{
    return sources['name'];
  }
  String get urlSources{
    return sources['url'];
  }

  String get getUrl => sources['url'];
  String get getSourceName => sources['name'];
}
