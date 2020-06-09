import 'package:flutter/material.dart';
import 'package:bloodbank/screens/articles_screen.dart';
import 'package:bloodbank/screens/donation_screen.dart';

List<Widget> _tabScroll() => [
      Tab(
        child: Container(
          alignment: Alignment.center,
          constraints: BoxConstraints.expand(width: 150),
          child: Text(
            'Articles',
            style: TextStyle(fontSize: 18.0),
          ),
        ),
      ),
      Tab(
        child: Container(
          alignment: Alignment.center,
          constraints: BoxConstraints.expand(width: 150),
          child: Text('Donations', style: TextStyle(fontSize: 18.0)),
        ),
      )
    ];

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Home')),
          backgroundColor: Color(0xFF9a0b0b),
          bottom: TabBar(
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width: 5.0, color: Colors.grey),
              insets: EdgeInsets.symmetric(horizontal: 16.0),
            ),
            tabs: _tabScroll(),
          ),
        ),
        backgroundColor: Colors.white,
        body: TabBarView(children: [
          ArticlesScreen(),
          DonationScreen(),
        ]),
      ),
    );
  }
}
