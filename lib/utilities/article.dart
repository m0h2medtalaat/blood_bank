import 'package:flutter/cupertino.dart';

class Article {
  final String title;
  bool like;
  final String content;
  final int id;

  Article(
      {@required this.id,
      @required this.title,
      @required this.like,
      @required this.content});

  factory Article.fromJson(dynamic json) {
    return Article(
        title: json['title'],
        like: json['is_favourite'] as bool,
        content: json['content'],
        id: json['id'] as int);
  }
}
