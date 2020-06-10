import 'package:flutter/cupertino.dart';

class User {
  String name;
  String email;
  String birthday;
  String bloodType;
  String lastDonationDate;
  String region;
  String city;
  String phoneNum;
  String password;
  String rePassword;

  User(
      {@required this.name,
      @required this.email,
      @required this.birthday,
      @required this.bloodType,
      @required this.lastDonationDate,
      @required this.region,
      @required this.city,
      @required this.phoneNum,
      @required this.password,
      @required this.rePassword});
}
