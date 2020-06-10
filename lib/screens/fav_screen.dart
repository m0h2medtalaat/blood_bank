import 'package:flutter/material.dart';
import 'package:bloodbank/utilities/article_data.dart';
import 'package:bloodbank/utilities/article.dart';
import 'package:provider/provider.dart';
import 'package:bloodbank/components/articleWidget.dart';

class FavScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Article> favArticles =
        Provider.of<ArticleData>(context).getFavArticles();
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
      body: CustomScrollView(
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return ArticleWidget(favArticles[index]);
              },
              childCount: favArticles.length,
            ),
          ),
        ],
      ),
    );
  }
}
