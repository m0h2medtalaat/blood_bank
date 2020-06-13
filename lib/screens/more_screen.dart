import 'package:bloodbank/screens/fav_screen.dart';
import 'package:bloodbank/screens/notification_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bloodbank/screens/contactus_screen.dart';
import 'package:bloodbank/screens/aboutapp_screen.dart';
import 'package:bloodbank/screens/logout_screen.dart';

class MoreScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('More'),
        ),
        backgroundColor: Color(0xFF9a0b0b),
      ),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverFixedExtentList(
            itemExtent: 600.0,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  constraints: BoxConstraints.expand(),
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
                    child: SafeArea(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
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
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => FavScreen()));
                              },
                            ),
                            MyListTile(
                                title: 'Contact Us',
                                icon: Icons.mail,
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              ContactUsScreen()));
                                }),
                            MyListTile(
                                title: 'About Application',
                                icon: Icons.help,
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              AboutAppScreen()));
                                }),
                            MyListTile(
                              title: 'Notification Settings',
                              icon: Icons.notifications,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            NotificationScreen()));
                              },
                            ),
                            MyListTile(
                              title: 'Logout',
                              icon: Icons.exit_to_app,
                              onTap: () {
                                showModalBottomSheet(
                                    context: context,
                                    isScrollControlled: true,
                                    builder: (context) => LogoutScreen());
                              },
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
  final Function onTap;
  MyListTile({this.title, this.icon, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
