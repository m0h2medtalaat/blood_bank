import 'package:flutter/material.dart';

class AboutAppScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Stack(
          children: <Widget>[
            Center(
              child: Text('About Application'),
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
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            color: Color(0xFFEE9E9E9),
            borderRadius: BorderRadius.circular(30.0),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Text(
                  'BloodBank is a Blood Donor App ( BloodHouse ) which puts the power to save a lives in the palm of your hand. The main purpose of BloodLine App is to create & manage a platform for all blood donors of Bangladesh & remove the blood crisis.',
                  style: TextStyle(color: Color(0xFF9a0b0b), fontSize: 16),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
