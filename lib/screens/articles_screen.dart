import 'package:flutter/material.dart';
import 'package:bloodbank/components/rounded_searchbar.dart';
import 'package:bloodbank/utilities/article_data.dart';
import 'package:bloodbank/utilities/article.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:bloodbank/components/articleWidget.dart';
import 'package:bloodbank/utilities/constants.dart';

class ArticlesScreen extends StatefulWidget {
  final String apiToken;

  ArticlesScreen({this.apiToken});

  @override
  _ArticlesScreenState createState() => _ArticlesScreenState();
}

class _ArticlesScreenState extends State<ArticlesScreen> {
  String filterID = '0';
  String keyword;
  @override
  Widget build(BuildContext context) {
    return Consumer<ArticleData>(
      builder: (BuildContext context, ArticleData articleData, _) {
        return Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RoundedSearchBar(
                  list: searchFilter,
                  searchFun: (value) {
                    keyword = value;
                    articleData.searchArticles(
                        apiToken: widget.apiToken,
                        keyword: keyword,
                        catID: filterID);
                  },
                  dropdownValue: searchFilter[int.parse(filterID)],
                  dropdownFun: (value) {
                    setState(() {
                      filterID = searchFilter.indexOf(value).toString();
                    });
                    if (keyword == null) {
                      keyword = '';
                    }
                    articleData.searchArticles(
                        apiToken: widget.apiToken,
                        keyword: keyword,
                        catID: filterID);
                  },
                ),
              ),
              FutureBuilder<List<Article>>(
                  future: articleData.futureArticleList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return Expanded(
                        child: RefreshIndicator(
                            color: Color(0xFF9a0b0b),
                            child: _myWidget(
                                snapshot: snapshot, apiToken: widget.apiToken),
                            onRefresh: () async {
                              if (keyword == null) {
                                keyword = '';
                              }
                              articleData.searchArticles(
                                  apiToken: widget.apiToken,
                                  keyword: keyword,
                                  catID: filterID);
                            }),
                      );
                    } else if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    }
                    return SpinKitWanderingCubes(
                      color: Color(0xFF9a0b0b),
                      size: 50.0,
                    );
                  }),
            ],
          ),
        );
      },
    );
  }

  Widget _myWidget({AsyncSnapshot snapshot, String apiToken}) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
            return ArticleWidget(
              article: snapshot.data[index],
              apiToken: apiToken,
            );
          }, childCount: snapshot.data.length),
        ),
      ],
    );
  }
}
//((keyword == null || keyword == '') &&
//                                    filterID == '0')
//                                ? () async {
//                                    articleData
//                                        .refreshArticlesList(widget.apiToken);
//                                  }
//                                : () async {
//                                    if (keyword == null) {
//                                      keyword = '';
//                                    }
//                                    articleData.searchArticles(
//                                        apiToken: widget.apiToken,
//                                        keyword: keyword,
//                                        catID: filterID);
