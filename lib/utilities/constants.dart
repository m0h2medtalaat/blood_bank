import 'package:flutter/material.dart';

List<String> bloodTypeList = ['O+', 'O-', 'A+', 'A-', 'B+', 'B-', 'AB+', 'AB-'];
List<String> citiesList = [
  'Cairo',
  'Giza',
  'Alexandria',
  'Suez',
  'Ismailia',
  'Sohag',
  'Minya',
  'Qena',
  'Aswan',
  'Luxor',
  'North Sinai',
  'South Sinai',
];
List<String> searchFilter = [
  'All',
  'Prevention',
  'Drug & Supplements',
  'Heath & Living',
];
const kSlidableTextStyle = TextStyle(
    color: Color(0xFF946986), fontSize: 16, fontWeight: FontWeight.w500);
const kTextFieldDecorationWhite = InputDecoration(
  hintText: 'Enter a value',
  hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
  fillColor: Colors.white,
  filled: true,
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.redAccent, width: 1.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Colors.redAccent, width: 2.0),
    borderRadius: BorderRadius.all(Radius.circular(32.0)),
  ),
);

const kTextFieldDecorationGrey = InputDecoration(
    hintText: 'Enter a value',
    hintStyle: TextStyle(color: Color(0xFF9a0b0b), fontSize: 15),
    fillColor: Color(0xFFE9E9E9),
    filled: true,
    contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFE9E9E9), width: 1.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Color(0xFFE9E9E9), width: 2.0),
      borderRadius: BorderRadius.all(Radius.circular(32.0)),
    ));
