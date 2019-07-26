import 'package:news/models/Source.dart';

class Article {
  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  Article.fromJson(Map<String, dynamic> json)
      : source = getSource(json['source']),
        author = json['author'],
        title = json['title'],
        description = json['description'],
        url = json['url'],
        urlToImage = json['urlToImage'],
        publishedAt = DateTime.parse(json['publishedAt']),
        content = json['content'];

  Map<String, dynamic> toJson() => {
    'source': source.toJson(), 
    'author': author,
    'title': title,
    'description': description,
    'url': url,
    'urlToImage': urlToImage,
    'publishedAt': publishedAt,
    'content': content
  };

  static Source getSource(Map<String, dynamic> json) {
    return Source.fromJson(json);
  }

}