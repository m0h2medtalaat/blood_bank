import 'package:bloodbank/screens/reset_password_screen.dart';
import 'package:bloodbank/utilities/constants.dart';
import 'package:bloodbank/utilities/user_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bloodbank/components/rounded_button.dart';
import 'package:bloodbank/screens/registration_screen.dart';
import 'package:provider/provider.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:bloodbank/components/rounded_alert.dart';

class ForgetScreen extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController _phoneNumberController = TextEditingController();
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
                      height: 15,
                    ),
                    TextFormField(
                      keyboardType: TextInputType.number,
                      controller: _phoneNumberController,
                      validator: (text) {
                        if (text == null || text.isEmpty) {
                          return 'Enter phone number';
                        } else if (text.length != 11) {
                          return 'Phone number must be 11 digit';
                        }
                        return null;
                      },
                      textAlign: TextAlign.center,
                      decoration: kTextFieldDecorationWhite.copyWith(
                          hintText: 'Phone Number'),
                    ),
                    RoundedButton(
                      onPressed: () async {
                        if (_formKey.currentState.validate()) {
                          try {
                            var data = await Provider.of<UserData>(context,
                                    listen: false)
                                .forget(_phoneNumberController.text);
                            print(data['pinCode']);
                            if (data != null) {
                              if (data['pinCode'] == 'not found') {
                                return showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return RoundedAlert(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          title: 'Accont not Found',
                                          content:
                                              'Please enter valid Phone Number');
                                    });
                              } else {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return RoundedAlert(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ResetPasswordScreen(
                                                          phoneNumber:
                                                              _phoneNumberController
                                                                  .text,
                                                        )));
                                          },
                                          title: 'Email sent',
                                          content:
                                              'Please check your email address for rest code. ${data['email']}');
                                    });
                              }
                            }
                          } catch (e) {
                            print(e);
                          }
                        }
                      },
                      title: 'Next',
                      colour: Colors.white,
                      textColor: Color(0xFF9a0b0b),
                    ),
                    SizedBox(
                      height: 25.0,
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
                                    builder: (context) =>
                                        RegistrationScreen()));
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
      ),
    ));
  }
}
