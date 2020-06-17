import 'package:flutter/material.dart';
import 'package:bloodbank/utilities/article.dart';
import 'package:bloodbank/screens/show_article_screen.dart';
import 'package:provider/provider.dart';
import 'package:bloodbank/utilities/article_data.dart';

class ArticleWidget extends StatelessWidget {
  final Article article;
  final apiToken;
  ArticleWidget({this.article, this.apiToken});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ShowArticleScreen(
                    apiToken: apiToken, articleId: article.id)));
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
                          .likeArticleInList(
                              apiToken: apiToken, id: article.id);
                    },
                    iconSize: 30,
                    icon: Icon(
                      article.like ? Icons.favorite : Icons.favorite_border,
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
                      article.title,
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
