import 'package:bloodbank/utilities/constants.dart';
import 'package:bloodbank/utilities/user.dart';
import 'package:bloodbank/utilities/user_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bloodbank/components/rounded_button.dart';
import 'package:provider/provider.dart';
import 'package:bloodbank/components/rounded_dropdownbutton.dart';

List<String> bloodTypeList = ['A', 'B'];
List<String> citiesList = ['Giza', 'Cairo'];
List<String> regionList = ['Haram', 'dd'];

class ProfileScreen extends StatefulWidget {
  final int indexOfUser;
  ProfileScreen({this.indexOfUser});
  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool edit = false;
  String bottomText = 'Edit';
  Color textColor = Color(0xFF9a0b0b);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    User _user = Provider.of<UserData>(context).users[widget.indexOfUser];

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text('Profile'),
        ),
        backgroundColor: Color(0xFF9a0b0b),
      ),
      body: Container(
          constraints: BoxConstraints.expand(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 25.0),
            child: SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 15.0,
                    ),
                    TextField(
                      style: TextStyle(color: textColor),
                      enabled: edit,
                      controller: TextEditingController(text: _user.name),
                      onChanged: (value) {
                        _user.name = value;
                      },
                      decoration: kTextFieldDecorationGrey.copyWith(
                          hintText: 'Name',
                          fillColor: Color(0xFFE9E9E9),
                          prefixIcon: Icon(
                            Icons.perm_identity,
                            color: Color(0xFF9a0b0b),
                          )),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextField(
                      style: TextStyle(color: textColor),
                      enabled: edit,
                      controller: TextEditingController(text: _user.email),
                      onChanged: (value) {
                        _user.email = value;
                      },
                      decoration: kTextFieldDecorationGrey.copyWith(
                          hintText: 'Email',
                          fillColor: Color(0xFFE9E9E9),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Color(0xFF9a0b0b),
                          )),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextField(
                      style: TextStyle(color: textColor),
                      enabled: edit,
                      controller: TextEditingController(text: _user.birthday),
                      onChanged: (value) {
                        _user.birthday = value;
                      },
                      decoration: kTextFieldDecorationGrey.copyWith(
                          hintText: 'Birthday',
                          fillColor: Color(0xFFE9E9E9),
                          prefixIcon: Icon(
                            Icons.calendar_today,
                            color: Color(0xFF9a0b0b),
                          )),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    //BloodType
                    RoundedBorderDropdown(
                      textColor: textColor,
                      hint: _user.bloodType,
                      icon: Icons.invert_colors,
                      colour: Color(0xFFE9E9E9),
                      borderColor: Color(0xFFE9E9E9),
                      hintColor: Color(0xFF9a0b0b),
                      value: _user.bloodType,
                      list: bloodTypeList,
                      onChange: edit
                          ? (value) {
                              setState(() {
                                _user.bloodType = value;
                              });
                            }
                          : null,
                    ),

                    SizedBox(
                      height: 15.0,
                    ),
                    TextField(
                      style: TextStyle(color: textColor),
                      enabled: edit,
                      controller:
                          TextEditingController(text: _user.lastDonationDate),
                      onChanged: (value) {
                        _user.lastDonationDate = value;
                      },
                      decoration: kTextFieldDecorationGrey.copyWith(
                          hintText: 'Last Donation Date',
                          fillColor: Color(0xFFE9E9E9),
                          prefixIcon: Icon(
                            Icons.calendar_today,
                            color: Color(0xFF9a0b0b),
                          )),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    //City
                    RoundedBorderDropdown(
                      textColor: textColor,
                      colour: Color(0xFFE9E9E9),
                      borderColor: Color(0xFFE9E9E9),
                      hintColor: Color(0xFF9a0b0b),
                      list: citiesList,
                      value: _user.city,
                      icon: Icons.home,
                      hint: _user.city,
                      onChange: edit
                          ? (value) {
                              setState(() {
                                _user.city = value;
                              });
                            }
                          : null,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    //region
                    RoundedBorderDropdown(
                      textColor: textColor,
                      colour: Color(0xFFE9E9E9),
                      borderColor: Color(0xFFE9E9E9),
                      hintColor: Color(0xFF9a0b0b),
                      list: regionList,
                      value: _user.region,
                      icon: Icons.home,
                      hint: _user.region,
                      onChange: edit
                          ? (value) {
                              setState(() {
                                _user.region = value;
                              });
                            }
                          : null,
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextField(
                      style: TextStyle(color: textColor),
                      enabled: edit,
                      controller: TextEditingController(text: _user.phoneNum),
                      onChanged: (value) {
                        _user.phoneNum = value;
                      },
                      decoration: kTextFieldDecorationGrey.copyWith(
                          hintText: 'Phone Number',
                          fillColor: Color(0xFFE9E9E9),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Color(0xFF9a0b0b),
                          )),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextField(
                      style: TextStyle(color: textColor),
                      enabled: edit,
                      obscureText: true,
                      controller: TextEditingController(text: _user.password),
                      onChanged: (value) {
                        _user.password = value;
                      },
                      decoration: kTextFieldDecorationGrey.copyWith(
                          hintText: 'Password',
                          fillColor: Color(0xFFE9E9E9),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color(0xFF9a0b0b),
                          )),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    TextField(
                      style: TextStyle(color: textColor),
                      enabled: edit,
                      obscureText: true,
                      controller: TextEditingController(text: _user.rePassword),
                      onChanged: (value) {
                        _user.rePassword = value;
                      },
                      decoration: kTextFieldDecorationGrey.copyWith(
                          hintText: 'Phone Number',
                          fillColor: Color(0xFFE9E9E9),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Color(0xFF9a0b0b),
                          )),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    RoundedButton(
                      title: bottomText,
                      textColor: Colors.redAccent,
                      colour: Color(0xFF9a0b0b),
                      onPressed: () {
                        if (edit == false) {
                          setState(() {
                            textColor = Colors.black;
                            edit = true;
                            bottomText = 'Save';
                          });
                        } else if (edit == true) {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled: true,
                              builder: (context) => SingleChildScrollView(
                                      child: Container(
                                    padding: EdgeInsets.only(
                                        bottom: MediaQuery.of(context)
                                            .viewInsets
                                            .bottom),
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xFF737373),
                                        ),
                                        height: 200,
                                        child: FlatButton(
                                          onPressed: () {
                                            setState(() {
                                              edit = false;
                                              bottomText = 'Edit';
                                              textColor = Color(0xFF9a0b0b);
                                              Provider.of<UserData>(context,
                                                      listen: false)
                                                  .edit(_user,
                                                      widget.indexOfUser);
                                              print('Edit Done ');
                                            });
                                            Navigator.pop(context);
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
                                                'Save ?',
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    color: Colors.redAccent),
                                              ),
                                            ),
                                          ),
                                        )),
                                  )));
                        }
                      },
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
