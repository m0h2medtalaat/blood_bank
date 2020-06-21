import 'package:bloodbank/utilities/constants.dart';
import 'package:bloodbank/utilities/user_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bloodbank/components/rounded_button.dart';
import 'package:provider/provider.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:bloodbank/components/rounded_alert.dart';
import 'package:bloodbank/screens/login_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  final String phoneNumber;
  ResetPasswordScreen({this.phoneNumber});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController _pinCodeController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();
    TextEditingController _rePasswordController = TextEditingController();
    return Scaffold(
        body: ModalProgressHUD(
      inAsyncCall: Provider.of<UserData>(context, listen: true).spinningStatus,
      child: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('resources/back_ground.jpg'),
                fit: BoxFit.cover)),
        child: Form(
          key: _formKey,
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
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _pinCodeController,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Enter reset code';
                        } else if (text.length != 4) {
                          return 'Pin Code = 4 Digits';
                        }
                        return null;
                      },
                      textAlign: TextAlign.center,
                      decoration: kTextFieldDecorationWhite.copyWith(
                          hintText: 'Pin Code'),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: _passwordController,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Enter password';
                        } else if (text.length < 5) {
                          return 'User 6 Characters or more';
                        }
                        return null;
                      },
                      obscureText: true,
                      textAlign: TextAlign.center,
                      decoration: kTextFieldDecorationWhite.copyWith(
                          hintText: 'Password'),
                    ),
                    SizedBox(height: 10.0),
                    TextFormField(
                      controller: _rePasswordController,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Enter password';
                        } else if (text != _passwordController.text) {
                          return 'Those passwords didn\'t match. Try again ';
                        }
                        return null;
                      },
                      obscureText: true,
                      textAlign: TextAlign.center,
                      decoration: kTextFieldDecorationWhite.copyWith(
                          hintText: 'Confirm Password'),
                    ),
                    RoundedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          try {
                            String msg = await Provider.of<UserData>(context,
                                    listen: false)
                                .resetPassword(
                                    pinCode: _pinCodeController.text,
                                    phoneNumber: phoneNumber,
                                    password: _passwordController.text,
                                    rePassword: _rePasswordController.text);
                            if (msg != null) {
                              if (msg == 'تم تغيير كلمة المرور بنجاح') {
                                print(
                                    'new password is :${_passwordController.text}');
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return RoundedAlert(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginScreen()),
                                              (Route<dynamic> route) => false,
                                            );
                                          },
                                          title: 'Success',
                                          content:
                                              'Password changed successfully');
                                    });
                              } else {
                                return showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return RoundedAlert(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          title: 'Incorrect Pin',
                                          content:
                                              'Please enter valid pin code');
                                    });
                              }
                            }
                          } catch (e) {
                            print(e);
                          }
                        }
                      },
                      title: 'Reset Password',
                      colour: Colors.white,
                      textColor: Color(0xFF9a0b0b),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    ));
  }
}
