import 'package:bloodbank/utilities/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bloodbank/components/rounded_button.dart';
import 'package:bloodbank/screens/show_map_screen.dart';
import 'package:bloodbank/components/rounded_dropdownbutton.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firebaseStore = Firestore.instance;

class AddDonationScreen extends StatefulWidget {
  final String apiToken;
  @override
  _AddDonationScreenState createState() => _AddDonationScreenState();

  AddDonationScreen({this.apiToken});
}

class _AddDonationScreenState extends State<AddDonationScreen> {
  String name;
  String age;
  String bloodType;
  String bloodBagNum;
  String region;
  String city;
  String phoneNum;
  String hospitalName = 'Hospital Location';
  var location;
  Color locationColor = Color(0xFF9a0b0b);
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Stack(
          children: <Widget>[
            Center(
              child: Text('Donation Request'),
            ),
            Positioned(
              child: SafeArea(
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.keyboard_backspace,
                    color: Colors.white,
                    size: 25,
                  ),
                ),
              ),
            ),
          ],
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
                    TextField(
                      onChanged: (value) {
                        name = value;
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
                      onChanged: (value) {
                        age = value;
                      },
                      decoration: kTextFieldDecorationGrey.copyWith(
                          hintText: 'Age',
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
                      hint: 'Blood type',
                      icon: Icons.invert_colors,
                      colour: Color(0xFFE9E9E9),
                      borderColor: Color(0xFFE9E9E9),
                      hintColor: Color(0xFF9a0b0b),
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
                    TextField(
                      onChanged: (value) {
                        bloodBagNum = value;
                      },
                      decoration: kTextFieldDecorationGrey.copyWith(
                          hintText: 'Blood Bags Number',
                          fillColor: Color(0xFFE9E9E9),
                          prefixIcon: Icon(
                            Icons.invert_colors,
                            color: Color(0xFF9a0b0b),
                          )),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    GestureDetector(
                      onTap: () {
                        _awaitLocationData(context);
                      },
                      child: Container(
                        width: 500,
                        height: 50.0,
                        decoration: BoxDecoration(
                          color: Color(0xFFE9E9E9),
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              Expanded(
                                flex: 1,
                                child: Icon(
                                  Icons.location_on,
                                  color: Color(0xFF9a0b0b),
                                ),
                              ),
                              Expanded(
                                flex: 7,
                                child: Text(hospitalName,
                                    style: TextStyle(
                                        color: locationColor, fontSize: 15)),
                              ),
                            ]),
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    //City
                    RoundedBorderDropdown(
                      colour: Color(0xFFE9E9E9),
                      borderColor: Color(0xFFE9E9E9),
                      hintColor: Color(0xFF9a0b0b),
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
                    //region
                    SizedBox(
                      height: 15.0,
                    ),
                    TextField(
                      onChanged: (value) {
                        phoneNum = value;
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
                    RoundedButton(
                      title: 'Add Request',
                      textColor: Colors.redAccent,
                      colour: Color(0xFF9a0b0b),
                      onPressed: () {
                        _firebaseStore
                            .collection('donations')
                            .document(
                                '${new DateTime.now().millisecondsSinceEpoch}')
                            .setData({
                          'name': name,
                          'age': age,
                          'bloodtype': bloodType,
                          'bloodbagnum': bloodBagNum,
                          'city': city,
                          'phonenum': phoneNum,
                          'location': GeoPoint(location.position.latitude,
                              location.position.longitude),
                          'apitoken': widget.apiToken,
                          'hospitalName':
                              "${location.name}, ${location.subAdministrativeArea}, ${location.administrativeArea}",
                        });
                        print(
                            '$name , $age,$bloodType,$bloodBagNum,$region,$city,$phoneNum');
                        Navigator.pop(context);
                      },
                    )
                  ],
                ),
              ),
            ),
          )),
    );
  }

  void _awaitLocationData(BuildContext context) async {
    // start the SecondScreen and wait for it to finish with a result
    location = await Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ShowMapScreen(),
        ));
    setState(() {
      hospitalName = location.name;
      locationColor = Colors.black;
    });
  }
}
