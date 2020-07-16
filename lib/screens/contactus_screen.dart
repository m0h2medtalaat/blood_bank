import 'package:flutter/material.dart';
import 'package:typicons_flutter/typicons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9E9E9),
      body: Stack(children: <Widget>[
        CustomScrollView(
          slivers: <Widget>[
            SliverFixedExtentList(
              itemExtent: 800.0,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    constraints: BoxConstraints.expand(),
                    child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 60),
                        child: SafeArea(
                          child: Column(children: <Widget>[
                            CircleAvatar(
                              radius: 50.0,
                              backgroundImage:
                                  AssetImage('resources/index.png'),
                            ),
                            Text(
                              'Mohamed Talaat',
                              style: TextStyle(
                                fontFamily: 'Rock',
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF3b3c40),
                              ),
                            ),
                            Text(
                              'Flutter Developer',
                              style: TextStyle(
                                fontFamily: 'Source',
                                fontSize: 20.00,
                                color: Color(0xFF636c77),
                                letterSpacing: 2.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            Divider(
                              color: Colors.black54,
                              thickness: 4,
                              indent: 50.0,
                              endIndent: 50.0,
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            MyListTile(
                              title: 'Phone Number',
                              icon: Icons.phone,
                              link: 'tel:+201555941803',
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            MyListTile(
                              title: 'Email',
                              icon: Icons.email,
                              link: 'mailto:m0h2medtalaat@gmail.com',
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            MyListTile(
                              title: 'LinkedIn',
                              icon: Typicons.social_linkedin,
                              link:
                                  'https://www.linkedin.com/in/m0h2medtalaat/',
                            ),
                            SizedBox(
                              height: 10.0,
                            ),
                            MyListTile(
                              title: 'GitHub',
                              icon: Typicons.social_github,
                              link: 'https://github.com/m0h2medtalaat/',
                            ),
                          ]),
                        )),
                  );
                },
                childCount: 1,
              ),
            )
          ],
        ),
        Positioned(
          left: 4.0,
          top: 4.0,
          child: SafeArea(
            child: IconButton(
              icon: Icon(
                Icons.arrow_back,
                color: Color(0xFF3b3c40),
                size: 28,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
        )
      ]),
    );
  }
}

class MyListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  final String link;
  MyListTile({this.title, this.icon, this.link});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.0),
      ),
      color: Colors.white,
      child: ListTile(
        onTap: () {
          launch(link);
        },
        title: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Icon(
                icon,
                color: Color(0xFF3b3c40),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
                flex: 6,
                child: Text(title,
                    style: TextStyle(
                        color: Color(0xFF3b3c40),
                        fontSize: 18,
                        fontWeight: FontWeight.bold)))
          ],
        ),
      ),
    );
  }
}
