import 'package:bloodbank/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bloodbank/components/rounded_button.dart';
import 'package:bloodbank/screens/registration_screen.dart';
import 'package:bloodbank/screens/main_screen.dart';

class LoginScreen extends StatelessWidget {
  final String id = 'LogInScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      constraints: BoxConstraints.expand(),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('resources/back_ground.jpg'),
              fit: BoxFit.cover)),
      child: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(),
                  child: Image.asset(
                    'resources/white_logo.png',
                  ),
                  height: 250.0,
                ),
                SizedBox(
                  height: 25.0,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  decoration: kTextFieldDecorationWhite.copyWith(
                      hintText: 'Phone Number'),
                ),
                SizedBox(height: 10.0),
                TextField(
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration:
                      kTextFieldDecorationWhite.copyWith(hintText: 'Password'),
                ),
                RoundedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (context) => MainScreen()),
                      (Route<dynamic> route) => false,
                    );
                  },
                  title: 'Login',
                  colour: Colors.white,
                  textColor: Color(0xFF9a0b0b),
                ),
                SizedBox(
                  height: 25.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      'Forget Password ?',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RegistrationScreen()));
                      },
                      child: Text(
                        'New here? Create an account',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
