import 'package:flutter/material.dart';
import 'package:bloodbank/components/rounded_searchbar.dart';
import 'package:bloodbank/screens/show_article_screen.dart';
import 'package:bloodbank/utilities/article_data.dart';
import 'package:bloodbank/utilities/article.dart';
import 'package:provider/provider.dart';

class ArticlesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return ArticleWidget(
                        Provider.of<ArticleData>(context, listen: true)
                            .articles[index]);
                  },
                  childCount: Provider.of<ArticleData>(context, listen: true)
                      .articles
                      .length,
                ),
              ),
            ],
          ),
        ),
//        Padding(
//          padding: const EdgeInsets.all(8.0),
//          child: FloatingActionButton(
//            onPressed: () {
//              Navigator.push(context,
//                  MaterialPageRoute(builder: (context) => AddDonationScreen()));
//            },
//            elevation: 5,
//            backgroundColor: Color(0xFF9a0b0b),
//            child: (Icon(
//              Icons.add,
//              color: Colors.white,
//              size: 30.0,
//            )),
//          ),
//        )
      ],
    );
  }
}

class ArticleWidget extends StatelessWidget {
  final Article _article;
  ArticleWidget(this._article);

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ShowArticleScreen(
                    articleIndex:
                        Provider.of<ArticleData>(context).getIndex(_article))));
      },
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Container(
          height: 200.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(25.0),
              image: DecorationImage(
                  image: AssetImage('resources/virus.jpg'), fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: const ShapeDecoration(
                      color: Colors.white, shape: CircleBorder()),
                  child: IconButton(
                    onPressed: () {
                      Provider.of<ArticleData>(context, listen: false)
                          .updateArticle(_article);
                    },
                    iconSize: 30,
                    icon: Icon(
                      _article.like ? Icons.favorite : Icons.favorite_border,
                      color: Color(0xFF9a0b0b),
                    ),
                  ),
                ),
              ),
              Container(
                  height: 42.0,
                  constraints: BoxConstraints(minWidth: double.infinity),
                  decoration: BoxDecoration(
                    color: Color(0xFF9a0b0b)
                        .withOpacity(0.7), //here i want to add opacity
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40.0),
                      topRight: Radius.circular(40.0),
                      bottomLeft: Radius.circular(40.0),
                      bottomRight: Radius.circular(40.0),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      _article.title,
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.0, color: Colors.white),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
