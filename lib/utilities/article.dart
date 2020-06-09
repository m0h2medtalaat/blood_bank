import 'package:flutter/cupertino.dart';

class Article {
  final String title;
  bool like;
  final String content;

  Article({@required this.title, this.like = false, @required this.content});

  void toggleDone() {
    like = !like;
  }
}
