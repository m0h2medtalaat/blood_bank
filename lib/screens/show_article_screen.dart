import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:bloodbank/utilities/article.dart';
import 'package:bloodbank/utilities/article_data.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HeroHeader implements SliverPersistentHeaderDelegate {
  HeroHeader({this.minExtent, this.maxExtent, this.article, this.apiToken});
  Article article;
  double maxExtent;
  double minExtent;
  final String apiToken;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset(
          'resources/virus.jpg',
          fit: BoxFit.cover,
        ),
        Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                Colors.black54,
              ],
              stops: [0.5, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              tileMode: TileMode.repeated,
            ),
          ),
        ),
        Positioned(
          left: 4.0,
          top: 4.0,
          child: SafeArea(
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Colors.white,
                size: 28,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        ),
        Positioned(
            bottom: 0.0,
            left: 0.0,
            right: 0.0,
            child: Container(
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.white, //here i want to add opacity
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(40.0),
                    topRight: Radius.circular(40.0),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 15),
                  child: Center(
                    child: Text(
                      article.title,
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 18.0, color: Color(0xFF9a0b0b)),
                    ),
                  ),
                ))),
        Positioned(
          bottom: 0.0,
          left: 15.0,
          child: SafeArea(
            child: IconButton(
              onPressed: () {
                Provider.of<ArticleData>(context, listen: false)
                    .likeArticle(apiToken: apiToken, id: article.id);
              },
              icon: Icon(
                article.like ? Icons.favorite : Icons.favorite_border,
                color: Color(0xFF9a0b0b),
                size: 25,
              ),
            ),
          ),
        ),
      ],
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }

  @override
  FloatingHeaderSnapConfiguration get snapConfiguration => null;

  @override
  OverScrollHeaderStretchConfiguration get stretchConfiguration =>
      OverScrollHeaderStretchConfiguration();
}

class ShowArticleScreen extends StatefulWidget {
  ShowArticleScreen({this.apiToken, this.articleId});
  final int articleId;
  final String apiToken;

  @override
  _ShowArticleScreenState createState() => _ShowArticleScreenState();
}

class _ShowArticleScreenState extends State<ShowArticleScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<ArticleData>(context, listen: false)
        .fetchArticleData(apiToken: widget.apiToken, id: widget.articleId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: FutureBuilder<Article>(
            future:
                Provider.of<ArticleData>(context, listen: true).futureArticle,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Center(
                    child:
                        _widget(snapshot: snapshot, apiToken: widget.apiToken));
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }
              return SpinKitWanderingCubes(
                color: Color(0xFF9a0b0b),
                size: 50.0,
              );
            }),
      ),
    );
  }

  Widget _widget({AsyncSnapshot snapshot, String apiToken}) {
    // Use LayoutBuilder to get the hero header size while keeping the image aspect-ratio
    return Container(
      child: CustomScrollView(
        slivers: <Widget>[
          SliverPersistentHeader(
            pinned: true,
            delegate: HeroHeader(
              minExtent: 160.0,
              maxExtent: 250.0,
              article: snapshot.data,
              apiToken: apiToken,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return Container(
                  color: Colors.white,
                  child: Center(
                    child: Text(snapshot.data.content,
                        style: TextStyle(
                            fontSize: 18.0, color: Color(0xFF878585))),
                  ),
                );
              },
//              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
}
