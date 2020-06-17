import 'package:flutter/foundation.dart';
import 'package:bloodbank/utilities/article.dart';
import 'package:bloodbank/utilities/apis.dart';

class ArticleData extends ChangeNotifier {
  Future<List<Article>> futureArticleList;
  Future<Article> futureArticle;
  void fetchArticlesListData(String apiToken) {
    futureArticleList = ArticlesApi().getArticlesList(apiToken);
  }

  void refreshArticlesList(String apiToken) async {
    futureArticleList = ArticlesApi().getArticlesList(apiToken);
    notifyListeners();
  }

  void likeArticleInList({String apiToken, int id}) async {
    ArticlesApi().likeArticle(apiToken: apiToken, articleID: id);
    await Future.delayed(Duration(milliseconds: 150));
    refreshArticlesList(apiToken);
    notifyListeners();
  }

  void fetchArticleData({String apiToken, int id}) {
    futureArticle = ArticlesApi().getArticle(apiToken: apiToken, articleID: id);
  }

  void refreshArticleData({String apiToken, int id}) {
    futureArticle = ArticlesApi().getArticle(apiToken: apiToken, articleID: id);
    notifyListeners();
  }

  void likeArticle({String apiToken, int id}) async {
    ArticlesApi().likeArticle(apiToken: apiToken, articleID: id);
    await Future.delayed(Duration(milliseconds: 150));
    refreshArticleData(apiToken: apiToken, id: id);
    refreshArticlesList(apiToken);
    notifyListeners();
  }

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
