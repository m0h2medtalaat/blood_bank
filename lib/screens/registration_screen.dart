import 'package:bloodbank/screens/login_screen.dart';
import 'package:bloodbank/utilities/constants.dart';
import 'package:bloodbank/utilities/user.dart';
import 'package:bloodbank/utilities/user_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bloodbank/components/rounded_button.dart';
import 'package:bloodbank/components/rounded_dropdownbutton.dart';
import 'package:bloodbank/components/date_button.dart';
import 'package:provider/provider.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:bloodbank/components/rounded_alert.dart';

class RegistrationScreen extends StatefulWidget {
  final String id = 'RegistrationId';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _name = TextEditingController();
  TextEditingController _email = TextEditingController();
  String birthday;
  String bloodTypeID;
  String lastDonationDate;
  String cityID;
  TextEditingController _phoneNum = TextEditingController();
  TextEditingController _password = TextEditingController();
  TextEditingController _rePassword = TextEditingController();
  String bloodTypeValue;
  String cityValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ModalProgressHUD(
        inAsyncCall:
            Provider.of<UserData>(context, listen: true).spinningStatus,
        child: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('resources/back_ground.jpg'),
                    fit: BoxFit.cover)),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Sign up',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 25.0),
                        ),
                        SizedBox(
                          height: 50.0,
                        ),
                        TextFormField(
                          validator: (text) {
                            if (text.length == 0) {
                              return 'Required';
                            }
                            return null;
                          },
                          controller: _name,
                          decoration: kTextFieldDecorationWhite.copyWith(
                              hintText: 'Name',
                              prefixIcon: Icon(
                                Icons.perm_identity,
                                color: Color(0xFF9a0b0b),
                              )),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Required';
                            }
                            return null;
                          },
                          controller: _email,
                          decoration: kTextFieldDecorationWhite.copyWith(
                              hintText: 'Email',
                              prefixIcon: Icon(
                                Icons.email,
                                color: Color(0xFF9a0b0b),
                              )),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        RoundedDateButton(
                          validator: (text) => text == null ? 'Required' : null,
                          title: 'Birthday',
                          onChanged: (value) {
                            birthday = "${value.toLocal()}".split(' ')[0];
                            print("${value.toLocal()}".split(' ')[0]);
                          },
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        RoundedBorderDropdown(
                          colour: Colors.white,
                          hint: 'Blood type',
                          icon: Icons.invert_colors,
                          borderColor: Colors.redAccent,
                          hintColor: Colors.grey,
                          value: bloodTypeValue,
                          list: bloodTypeList,
                          onChange: (value) {
                            setState(() {
                              bloodTypeID =
                                  (bloodTypeList.indexOf(value) + 1).toString();
                              bloodTypeValue = value;
                            });
                          },
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        RoundedDateButton(
                          validator: (text) => text == null ? 'Required' : null,
                          title: 'Last donation date',
                          onChanged: (value) {
                            lastDonationDate =
                                "${value.toLocal()}".split(' ')[0];
                            print("${value.toLocal()}".split(' ')[0]);
                          },
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        RoundedBorderDropdown(
                          colour: Colors.white,
                          borderColor: Colors.redAccent,
                          hintColor: Colors.grey,
                          list: citiesList,
                          value: cityValue,
                          icon: Icons.home,
                          hint: 'Select City',
                          onChange: (value) {
                            setState(() {
                              cityID =
                                  (citiesList.indexOf(value) + 1).toString();
                              cityValue = value;
                            });
                          },
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Required';
                            } else if (text.length != 11) {
                              return 'Phone number must be 11 digit';
                            }
                            return null;
                          },
                          controller: _phoneNum,
                          decoration: kTextFieldDecorationWhite.copyWith(
                              hintText: 'Phone Number',
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Color(0xFF9a0b0b),
                              )),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          validator: (text) {
                            if (text == null || text.isEmpty) {
                              return 'Required';
                            } else if (text.length < 5) {
                              return 'User 6 Characters or more';
                            }
                            return null;
                          },
                          controller: _password,
                          obscureText: true,
                          decoration: kTextFieldDecorationWhite.copyWith(
                              hintText: 'Password',
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Color(0xFF9a0b0b),
                              )),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        TextFormField(
                          validator: (text) {
                            if (text != _password.text) {
                              return 'Those passwords didn\'t match. Try again';
                            }
                            return null;
                          },
                          controller: _rePassword,
                          obscureText: true,
                          decoration: kTextFieldDecorationWhite.copyWith(
                              hintText: 're-Password',
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Color(0xFF9a0b0b),
                              )),
                        ),
                        SizedBox(
                          height: 15.0,
                        ),
                        RoundedButton(
                          title: 'Sign up',
                          colour: Colors.white,
                          textColor: Color(0xFF9a0b0b),
                          onPressed: () async {
                            if (_formKey.currentState.validate()) {
                              try {
                                String apiToken = await Provider.of<UserData>(
                                        context,
                                        listen: false)
                                    .register(User(
                                        name: _name.text,
                                        phoneNum: _phoneNum.text,
                                        cityID: cityID,
                                        bloodTypeID: bloodTypeID,
                                        birthday: birthday,
                                        email: _email.text,
                                        lastDonationDate: lastDonationDate,
                                        password: _password.text,
                                        rePassword: _rePassword.text));
                                if (apiToken != null) {
                                  if (apiToken ==
                                      'قيمة البريد الالكتروني مُستخدمة من قبل.') {
                                    return showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return RoundedAlert(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            title: "Registration Error",
                                            content:
                                                'This Email is used before. Try another',
                                          );
                                        });
                                  } else if (apiToken ==
                                      'قيمة الهاتف مُستخدمة من قبل.') {
                                    return showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return RoundedAlert(
                                            onPressed: () {
                                              Navigator.pop(context);
                                            },
                                            title: 'Registration Error',
                                            content:
                                                'This number is used before. Try another',
                                          );
                                        });
                                  } else {
                                    print(
                                        'Added email = ${_email.text} , pw =${_password.text}');
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LoginScreen()),
                                      (Route<dynamic> route) => false,
                                    );
                                  }
                                }
                              } catch (e) {
                                print(e);
                              }
                            }
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
