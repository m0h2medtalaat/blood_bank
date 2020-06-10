import 'package:flutter/foundation.dart';
import 'package:bloodbank/utilities/article.dart';

class ArticleData extends ChangeNotifier {
  List<Article> articles = [
    Article(
        title: 'title1',
        content:
            'people may become infected by touching a contaminated surface and then touching their.'),
    Article(
        title: 'title2',
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

  List<Article> getFavArticles() {
    List<Article> fav = [];
    for (int i = 0; i < articles.length; i++) {
      if (articles[i].like == true) {
        fav.add(articles[i]);
      }
    }
    return fav;
  }
}
