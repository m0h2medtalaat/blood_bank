import 'package:flutter/foundation.dart';
import 'package:bloodbank/utilities/article.dart';
import 'package:bloodbank/utilities/apis.dart';

class ArticleData extends ChangeNotifier {
  Future<List<Article>> futureArticleList;
  Future<Article> futureArticle;
  Future<List<Article>> favArticleList;
  void searchArticles({String apiToken, String catID, String keyword}) async {
    futureArticleList = ArticlesApi().searchArticlesApi(
        apiToken: apiToken, categoryID: catID, keyword: keyword);
    await Future.delayed(Duration(milliseconds: 150));
    notifyListeners();
  }

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
    refreshFavArticleList(apiToken: apiToken);
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
    refreshFavArticleList(apiToken: apiToken);
    notifyListeners();
  }

  void getFavArticleList({String apiToken}) {
    favArticleList = ArticlesApi().getFavArticlesList(apiToken);
  }

  void refreshFavArticleList({String apiToken}) {
    favArticleList = ArticlesApi().getFavArticlesList(apiToken);
    notifyListeners();
  }
}
