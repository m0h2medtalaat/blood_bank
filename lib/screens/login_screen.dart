import 'package:bloodbank/utilities/constants.dart';
import 'package:bloodbank/utilities/user_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bloodbank/components/rounded_button.dart';
import 'package:bloodbank/screens/registration_screen.dart';
import 'package:bloodbank/screens/main_screen.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final String id = 'LogInScreen';

  @override
  Widget build(BuildContext context) {
    String email;
    String password;
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
                  onChanged: (value) {
                    email = value;
                  },
                  textAlign: TextAlign.center,
                  decoration:
                      kTextFieldDecorationWhite.copyWith(hintText: 'Email'),
                ),
                SizedBox(height: 10.0),
                TextField(
                  onChanged: (value) {
                    password = value;
                  },
                  obscureText: true,
                  textAlign: TextAlign.center,
                  decoration:
                      kTextFieldDecorationWhite.copyWith(hintText: 'Password'),
                ),
                RoundedButton(
                  onPressed: () {
                    int indexOfUser =
                        Provider.of<UserData>(context, listen: false)
                            .login(email, password);
                    if (indexOfUser != 404) {
                      print('$email login');
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MainScreen(indexOfUser: indexOfUser)),
                        (Route<dynamic> route) => false,
                      );
                    }
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
