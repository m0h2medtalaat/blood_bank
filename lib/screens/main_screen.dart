import 'package:bloodbank/screens/more_screen.dart';
import 'package:bloodbank/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:bloodbank/screens/home_screen.dart';

class MainScreen extends StatefulWidget {
  final String apiToken;
  MainScreen({this.apiToken});

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Widget> _screensBody = [
      HomeScreen(),
      ProfileScreen(apiToken: widget.apiToken),
      Container(),
      MoreScreen(),
    ];
    return Scaffold(
      body: _screensBody[_currentIndex],
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: Color(0xFF9a0b0b),
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              activeColor: Colors.white,
              title: Text(
                'Home',
                style: TextStyle(color: Colors.white),
              ),
              icon: Icon(
                Icons.home,
                color: Colors.white,
              )),
          BottomNavyBarItem(
              activeColor: Colors.white,
              title: Text('Profile', style: TextStyle(color: Colors.white)),
              icon: Icon(
                Icons.person,
                color: Colors.white,
              )),
          BottomNavyBarItem(
              activeColor: Colors.white,
              title:
                  Text('Notifications', style: TextStyle(color: Colors.white)),
              icon: Icon(
                Icons.notifications,
                color: Colors.white,
              )),
          BottomNavyBarItem(
              activeColor: Colors.white,
              title: Text('More', style: TextStyle(color: Colors.white)),
              icon: Icon(
                Icons.more_horiz,
                color: Colors.white,
              )),
        ],
      ),
    );
  }
}
