import 'package:flutter/foundation.dart';
import 'package:bloodbank/utilities/article.dart';

class ArticleData extends ChangeNotifier {
  List<Article> articles = [
    Article(
        title: 'title',
        content:
            'people may become infected by touching a contaminated surface and then touching their.')
  ];

  void updateArticle(Article article) {
    article.toggleDone();
    notifyListeners();
  }

  int getIndex(Article article) {
    return articles.indexOf(article);
  }
}
