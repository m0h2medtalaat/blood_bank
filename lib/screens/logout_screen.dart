import 'package:bloodbank/screens/login_screen.dart';
import 'package:flutter/material.dart';

class LogoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Container(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
          decoration: BoxDecoration(
            color: Color(0xFF737373),
          ),
          height: 200,
          child: FlatButton(
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (Route<dynamic> route) => false,
              );
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20.0),
                  topLeft: Radius.circular(20.0),
                ),
                color: Color(0xFF9a0b0b),
              ),
              height: 42,
              width: 500,
              child: Center(
                child: Text(
                  'logout ?',
                  style: TextStyle(fontSize: 18, color: Colors.redAccent),
                ),
              ),
            ),
          )),
    ));
  }
}
