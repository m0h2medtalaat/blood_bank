import 'package:bloodbank/utilities/constants.dart';
import 'package:bloodbank/utilities/user_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bloodbank/components/rounded_button.dart';
import 'package:bloodbank/screens/registration_screen.dart';
import 'package:bloodbank/screens/main_screen.dart';
import 'package:provider/provider.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class LoginScreen extends StatelessWidget {
  final String id = 'LogInScreen';

  @override
  Widget build(BuildContext context) {
    String phoneNumber;
    String password;
    return Scaffold(
        body: ModalProgressHUD(
      inAsyncCall: Provider.of<UserData>(context, listen: true).spinningStatus,
      child: Container(
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
                      phoneNumber = value;
                    },
                    textAlign: TextAlign.center,
                    decoration: kTextFieldDecorationWhite.copyWith(
                        hintText: 'Phone Number'),
                  ),
                  SizedBox(height: 10.0),
                  TextField(
                    onChanged: (value) {
                      password = value;
                    },
                    obscureText: true,
                    textAlign: TextAlign.center,
                    decoration: kTextFieldDecorationWhite.copyWith(
                        hintText: 'Password'),
                  ),
                  RoundedButton(
                    onPressed: () async {
                      try {
                        String apiToken =
                            await Provider.of<UserData>(context, listen: false)
                                .login(phoneNumber, password);
                        if (apiToken != null) {
                          print('$phoneNumber login');
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    MainScreen(apiToken: apiToken)),
                            (Route<dynamic> route) => false,
                          );
                        }
                      } catch (e) {
                        print(e);
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
      ),
    ));
  }
}
