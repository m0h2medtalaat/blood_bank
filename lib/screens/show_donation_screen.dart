import 'package:bloodbank/utilities/donation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:bloodbank/components/rounded_button.dart';
import 'package:provider/provider.dart';
import 'package:bloodbank/utilities/donation_data.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowDonationScreen extends StatelessWidget {
  final int donationIndex;
  ShowDonationScreen(this.donationIndex);

  @override
  Widget build(BuildContext context) {
    return Consumer<DonationData>(builder: (context, donationData, child) {
      Donation _donation = donationData.donations[donationIndex];
      List<Marker> allMarkers = [
        Marker(
            markerId: MarkerId('myMarker'),
            onTap: () {
              print('Marker Tapped');
            },
            position: LatLng(_donation.hospitalLocation.position.latitude,
                _donation.hospitalLocation.position.longitude))
      ];
      return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Stack(
            children: <Widget>[
              Center(
                child: Text('${_donation.name} Request',
                    style: TextStyle(fontSize: 15.0)),
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
        body: CustomScrollView(
          slivers: <Widget>[
            SliverFixedExtentList(
              itemExtent: 800.0,
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  return Container(
                    constraints: BoxConstraints.expand(),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 25.0),
                      child: SafeArea(
                        child: Column(
                          children: <Widget>[
//                            Container(
//                              height: 100,
//                              child: Image(
//                                image: AssetImage('resources/red_logo.png'),
//                              ),
//                            ),
                            Column(children: <Widget>[
                              MyListTile(
                                title: 'Name: ${_donation.name}',
                                icon: Icons.perm_identity,
                              ),
                              MyListTile(
                                title: 'Age :${_donation.age}',
                                icon: Icons.calendar_today,
                              ),
                              MyListTile(
                                title: 'Blood Type :${_donation.bloodType}',
                                icon: Icons.invert_colors,
                              ),
                              MyListTile(
                                title:
                                    'Blood Bag Number:${_donation.bloodBagNum}',
                                icon: Icons.invert_colors,
                              ),
                              MyListTile(
                                title:
                                    'Hospital:${_donation.hospitalLocation.name},${_donation.hospitalLocation.subAdministrativeArea},${_donation.hospitalLocation.administrativeArea}',
                                icon: Icons.location_on,
                              ),
                              MyListTile(
                                title: 'Phone Number :${_donation.phoneNum}',
                                icon: Icons.phone,
                              ),
                              Container(
                                height: 200,
                                child: GoogleMap(
                                  markers: Set.from(allMarkers),
                                  initialCameraPosition: CameraPosition(
                                      target: LatLng(
                                          _donation.hospitalLocation.position
                                              .latitude,
                                          _donation.hospitalLocation.position
                                              .longitude),
                                      zoom: 16.0),
                                ),
                              ),
                              RoundedButton(
                                onPressed: () {
                                  launch("tel://${_donation.phoneNum}");
                                },
                                title: 'Call',
                                colour: Color(0xFF9a0b0b),
                                textColor: Colors.redAccent,
                              )
                            ])
                          ],
                        ),
                      ),
                    ),
                  );
                },
                childCount: 1,
              ),
            )
          ],
        ),
      );
    });
  }
}

class MyListTile extends StatelessWidget {
  final String title;
  final IconData icon;
  MyListTile({this.title, this.icon});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: ListTile(
        title: Row(
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Icon(
                icon,
                color: Color(0xFF9a0b0b),
              ),
            ),
            SizedBox(
              width: 5,
            ),
            Expanded(
                flex: 6,
                child: Text(title,
                    style: TextStyle(color: Color(0xFF9a0b0b), fontSize: 18)))
          ],
        ),
      ),
    );
  }
}
