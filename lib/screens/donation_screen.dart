import 'package:bloodbank/screens/add_donation_screen.dart';
import 'package:bloodbank/utilities/donation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:bloodbank/utilities/constants.dart';
import 'package:provider/provider.dart';
import 'package:bloodbank/screens/show_donation_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class DonationScreen extends StatelessWidget {
  final String apiToken;

  DonationScreen({this.apiToken});

  @override
  Widget build(BuildContext context) {
    List<Donation> donationList = Provider.of<List<Donation>>(context);
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AddDonationScreen(
                          apiToken: apiToken,
                        )));
          },
          elevation: 5,
          backgroundColor: Colors.white,
          child: (Icon(
            Icons.add,
            color: Color(0xFF9a0b0b),
            size: 40.0,
          )),
        ),
        body: donationList != null
            ? Padding(
                padding: EdgeInsets.only(bottom: 15.0),
                child: CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          return RoundedSlidable(
                              donation: donationList[index],
                              donationIndex: index);
                        },
                        childCount: donationList.length,
                      ),
                    ),
                  ],
                ),
              )
            : SpinKitWanderingCubes(
                color: Color(0xFF9a0b0b),
                size: 50.0,
              ));
  }
}

class RoundedSlidable extends StatelessWidget {
  final Donation donation;
  final int donationIndex;

  RoundedSlidable({this.donation, this.donationIndex});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      actionPane: SlidableDrawerActionPane(),
      actionExtentRatio: 0.12,
      child: Stack(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
                bottom: 15, top: 15.0, left: 20.0, right: 15.0),
            child: Container(
              width: 500,
              height: 100.0,
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black54,
                      blurRadius: 20,
                      offset: Offset(0, -2))
                ],
                borderRadius: BorderRadius.circular(50.0),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'Patient Name: ${donation.name}',
                      style: kSlidableTextStyle,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Hospital: ${donation.hospitalName.split(',')[0]}',
                      style: kSlidableTextStyle,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'City: ${donation.city}',
                      style: kSlidableTextStyle,
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            left: 10.0,
            top: 5.0,
            child: Container(
              width: 100,
              height: 100,
              decoration: const ShapeDecoration(
                  color: Color(0xFF9a0b0b), shape: CircleBorder()),
              child: Center(
                child: Text(
                  donation.bloodType,
                  style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.w700,
                      color: Colors.white),
                ),
              ),
            ),
          )
        ],
      ),
      secondaryActions: <Widget>[
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: Container(
            width: 50,
            height: 50,
            decoration: const ShapeDecoration(
                color: Colors.deepOrange, shape: CircleBorder()),
            child: Center(
              child: IconButton(
                onPressed: () {
                  launch("tel://${donation.phoneNum}");
                },
                icon: Icon(
                  Icons.phone,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(2),
          child: Container(
            width: 50,
            height: 50,
            decoration: const ShapeDecoration(
                color: Color(0xFF9a0b0b), shape: CircleBorder()),
            child: Center(
              child: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              ShowDonationScreen(donationIndex)));
                },
                icon: Icon(
                  Icons.info,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
