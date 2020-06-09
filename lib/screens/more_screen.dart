import 'package:bloodbank/screens/fav_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Stack(
          children: <Widget>[
            Center(
              child: Text('More'),
            ),
          ],
        ),
        backgroundColor: Color(0xFF9a0b0b),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverFixedExtentList(
            itemExtent: 800.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  constraints: BoxConstraints.expand(),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
                    child: SafeArea(
                      child: Column(
                        children: <Widget>[
                          Container(
                            height: 100,
                            child: Image(
                              image: AssetImage('resources/red_logo.png'),
                            ),
                          ),
                          Column(children: <Widget>[
                            MyListTile(
                              title: 'Favorites',
                              icon: Icons.favorite,
                              screen: FavScreen(),
                            ),
                            MyListTile(
                              title: 'Contact Us',
                              icon: Icons.mail,
                              screen: FavScreen(),
                            ),
                            MyListTile(
                              title: 'About App',
                              icon: Icons.help,
                              screen: FavScreen(),
                            ),
                            MyListTile(
                              title: 'Notification Settings',
                              icon: Icons.notifications,
                              screen: FavScreen(),
                            ),
                            MyListTile(
                              title: 'Logout',
                              icon: Icons.exit_to_app,
                              screen: FavScreen(),
                            )
                          ])
                        ],
                      ),
                    ),
                  ),
                );
              },
              childCount: 1,
            ),
          )
        ],
      ),
    );
  }
}

class MyListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final screen;
  MyListTile({this.title, this.icon, this.screen});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => screen));
      },
      child: Card(
        color: Colors.white,
        child: ListTile(
          title: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Icon(
                  icon,
                  color: Color(0xFF9a0b0b),
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Expanded(
                  flex: 8,
                  child: Text(title,
                      style: TextStyle(color: Color(0xFF9a0b0b), fontSize: 18)))
            ],
          ),
        ),
      ),
    );
  }
}
