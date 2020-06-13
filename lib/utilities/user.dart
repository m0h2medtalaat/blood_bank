import 'package:flutter/cupertino.dart';

class User {
  String name;
  String email;
  String birthday;
  String bloodTypeID;
  String lastDonationDate;
  String cityID;
  String phoneNum;
  String password;
  String rePassword;

  User(
      {@required this.name,
      @required this.email,
      @required this.birthday,
      @required this.bloodTypeID,
      @required this.lastDonationDate,
      @required this.cityID,
      @required this.phoneNum,
      @required this.password,
      @required this.rePassword});
}
