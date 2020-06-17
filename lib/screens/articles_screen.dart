import 'package:flutter/material.dart';
import 'package:bloodbank/components/rounded_searchbar.dart';
import 'package:bloodbank/utilities/article_data.dart';
import 'package:bloodbank/utilities/article.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:bloodbank/components/articleWidget.dart';

class ArticlesScreen extends StatelessWidget {
  final String apiToken;

  ArticlesScreen({this.apiToken});

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticleData>(
      builder: (BuildContext context, ArticleData articleData, _) {
        return Center(
          child: FutureBuilder<List<Article>>(
              future: articleData.futureArticleList,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return RefreshIndicator(
                    child: _myWidget(snapshot: snapshot, apiToken: apiToken),
                    onRefresh: () async {
                      articleData.refreshArticlesList(apiToken);
                    },
                  );
                } else if (snapshot.hasError) {
                  return Text("${snapshot.error}");
                }
                return SpinKitWanderingCubes(
                  color: Color(0xFF9a0b0b),
                  size: 50.0,
                );
              }),
        );
      },
    );
  }

  Widget _myWidget({AsyncSnapshot snapshot, String apiToken}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: RoundedSearchBar(),
        ),
        Expanded(
            child: CustomScrollView(
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
        )),
      ],
    );
  }
}
