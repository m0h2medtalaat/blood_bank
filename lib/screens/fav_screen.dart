import 'package:flutter/material.dart';
import 'package:bloodbank/utilities/article_data.dart';
import 'package:bloodbank/utilities/article.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:bloodbank/components/articleWidget.dart';

class FavScreen extends StatelessWidget {
  final String apiToken;

  FavScreen({this.apiToken});

  @override
  Widget build(BuildContext context) {
    return Consumer<ArticleData>(
      builder: (BuildContext context, ArticleData articleData, _) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Stack(
              children: <Widget>[
                Center(
                  child: Text('Favorites'),
                ),
                Positioned(
                  child: SafeArea(
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.keyboard_backspace,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            backgroundColor: Color(0xFF9a0b0b),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0),
            child: Center(
              child: FutureBuilder<List<Article>>(
                  future: articleData.favArticleList,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return RefreshIndicator(
                        color: Color(0xFF9a0b0b),
                        child:
                            _myWidget(snapshot: snapshot, apiToken: apiToken),
                        onRefresh: () async {
                          articleData.refreshFavArticleList(apiToken: apiToken);
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
            ),
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
