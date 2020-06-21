import 'dart:async';
import 'package:flutter/material.dart';
import 'package:bloodbank/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:bloodbank/screens/slider_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  SplashScreenState createState() => new SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  Future checkFirstSeen() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool _seen = (prefs.getBool('seen') ?? false);
    if (_seen) {
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => LoginScreen()));
    } else {
      prefs.setBool('seen', true);
      Navigator.of(context).pushReplacement(
          new MaterialPageRoute(builder: (context) => SliderScreen()));
    }
  }

  @override
  void initState() {
    super.initState();
    new Timer(new Duration(seconds: 5), () {
      checkFirstSeen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('resources/splash.png'), fit: BoxFit.cover))
//        child: Column(
//          mainAxisAlignment: MainAxisAlignment.spaceBetween,
//          crossAxisAlignment: CrossAxisAlignment.stretch,
//          children: <Widget>[
//            Expanded(
//              child: Container(
//                decoration: BoxDecoration(
//                  image: DecorationImage(
//                      image: AssetImage('resources/splash_top.png'),
//                      fit: BoxFit.cover),
//                ),
//              ),
//            ),
//            Expanded(
//              child: Container(
//                height: 50.0,
//                decoration: BoxDecoration(
//                  image: DecorationImage(
//                    image: AssetImage('resources/red_logo.png'),
//                  ),
//                ),
//              ),
//            ),
//            Expanded(
//              child: Container(
//                decoration: BoxDecoration(
//                  image: DecorationImage(
//                      image: AssetImage('resources/splash_bottom.png'),
//                      fit: BoxFit.cover),
//                ),
//              ),
//            ),
//          ],
//        ),
          ),
    );
  }
}
