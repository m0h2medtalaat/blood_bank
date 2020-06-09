import 'package:bloodbank/utilities/constants.dart';
import 'package:bloodbank/utilities/donation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bloodbank/components/rounded_button.dart';
import 'package:provider/provider.dart';
import 'package:bloodbank/utilities/donation_data.dart';
import 'package:bloodbank/screens/show_map_screen.dart';

List<String> bloodTypeList = ['A', 'B'];
List<String> citiesList = ['Giza', 'Cairo'];
List<String> regionList = ['Haram', 'dd'];

class AddDonationScreen extends StatefulWidget {
  @override
  _AddDonationScreenState createState() => _AddDonationScreenState();
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
                    Container(
                        width: 500,
                        height: 50.0,
                        padding: EdgeInsets.symmetric(vertical: 16.0),
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
                                Icons.invert_colors,
                                color: Color(0xFF9a0b0b),
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: DropdownButton(
                                  isExpanded: true,
                                  elevation: 5,
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 30,
                                    color: Color(0xFF9a0b0b),
                                  ),
                                  hint: Text('Blood type',
                                      style: TextStyle(
                                          color: Color(0xFF9a0b0b),
                                          fontSize: 15)),
                                  items: bloodTypeList
                                      .map((value) => DropdownMenuItem(
                                            child: Text(
                                              value,
                                            ),
                                            value: value,
                                          ))
                                      .toList(),
                                  onChanged: (String value) {
                                    setState(() {
                                      bloodType = value;
                                    });
                                  },
                                  value: bloodType,
                                ),
                              ),
                            ),
                          ],
                        )),
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
                    Container(
                        width: 500,
                        height: 50.0,
                        padding: EdgeInsets.symmetric(vertical: 16.0),
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
                                Icons.home,
                                color: Color(0xFF9a0b0b),
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: DropdownButton(
                                  isExpanded: true,
                                  elevation: 5,
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 30,
                                    color: Color(0xFF9a0b0b),
                                  ),
                                  hint: Text('Select City',
                                      style: TextStyle(
                                          color: Color(0xFF9a0b0b),
                                          fontSize: 15)),
                                  items: citiesList
                                      .map((value) => DropdownMenuItem(
                                            child: Text(
                                              value,
                                            ),
                                            value: value,
                                          ))
                                      .toList(),
                                  onChanged: (String value) {
                                    setState(() {
                                      city = value;
                                    });
                                  },
                                  value: city,
                                ),
                              ),
                            ),
                          ],
                        )),
                    SizedBox(
                      height: 15.0,
                    ),
                    //region
                    Container(
                        width: 500,
                        height: 50.0,
                        padding: EdgeInsets.symmetric(vertical: 16.0),
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
                                Icons.home,
                                color: Color(0xFF9a0b0b),
                              ),
                            ),
                            Expanded(
                              flex: 7,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 12.0),
                                child: DropdownButton(
                                  isExpanded: true,
                                  elevation: 5,
                                  icon: Icon(
                                    Icons.keyboard_arrow_down,
                                    size: 30,
                                    color: Color(0xFF9a0b0b),
                                  ),
                                  hint: Text('Select Region',
                                      style: TextStyle(
                                          color: Color(0xFF9a0b0b),
                                          fontSize: 15)),
                                  items: regionList
                                      .map((value) => DropdownMenuItem(
                                            child: Text(
                                              value,
                                            ),
                                            value: value,
                                          ))
                                      .toList(),
                                  onChanged: (String value) {
                                    setState(() {
                                      region = value;
                                    });
                                  },
                                  value: region,
                                ),
                              ),
                            ),
                          ],
                        )),
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
                        Provider.of<DonationData>(context, listen: false)
                            .addDonation(Donation(
                                name: name,
                                age: age,
                                bloodType: bloodType,
                                bloodBagNum: bloodBagNum,
                                region: region,
                                city: city,
                                phoneNum: phoneNum,
                                hospitalLocation: location));
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
