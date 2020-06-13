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

List<String> bloodTypeList = ['A', 'B'];
List<String> citiesList = ['Giza', 'Cairo'];
List<String> regionList = ['Haram', 'dd'];

class RegistrationScreen extends StatefulWidget {
  final String id = 'RegistrationId';
  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String name;
  String email;
  String birthday;
  String bloodType;
  String lastDonationDate;
  String city;
  String phoneNum;
  String password;
  String rePassword;

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
                      TextField(
                        onChanged: (value) {
                          name = value;
                        },
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
                      TextField(
                        onChanged: (value) {
                          email = value;
                        },
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
                        value: bloodType,
                        list: bloodTypeList,
                        onChange: (value) {
                          setState(() {
                            bloodType = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      RoundedDateButton(
                        title: 'Last donation date',
                        onChanged: (value) {
                          lastDonationDate = "${value.toLocal()}".split(' ')[0];
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
                        value: city,
                        icon: Icons.home,
                        hint: 'Select City',
                        onChange: (value) {
                          setState(() {
                            city = value;
                          });
                        },
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      SizedBox(
                        height: 15.0,
                      ),
                      TextField(
                        onChanged: (value) {
                          phoneNum = value;
                        },
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
                      TextField(
                        onChanged: (value) {
                          password = value;
                        },
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
                      TextField(
                        onChanged: (value) {
                          rePassword = value;
                        },
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
                          try {
                            String apiToken = await Provider.of<UserData>(
                                    context,
                                    listen: false)
                                .register(User(
                                    name: name,
                                    phoneNum: phoneNum,
                                    cityID: citiesList.indexOf(city).toString(),
                                    bloodTypeID: bloodTypeList
                                        .indexOf(bloodType)
                                        .toString(),
                                    birthday: birthday,
                                    email: email,
                                    lastDonationDate: lastDonationDate,
                                    password: password,
                                    rePassword: rePassword));
                            if (apiToken != null) {
                              print('Added email = $email , pw =$password');
                              Navigator.pop(context);
                            }
                          } catch (e) {
                            print(e);
                          }
                        },
                      )
                    ],
                  ),
                ),
              ),
            )),
      ),
    );
  }
}
