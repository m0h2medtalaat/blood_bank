import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class ShowMapScreen extends StatefulWidget {
  @override
  _ShowMapScreenState createState() => _ShowMapScreenState();
}

class _ShowMapScreenState extends State<ShowMapScreen> {
  GoogleMapController mapController;
  String searchAddr;
  var pos;
  List<Marker> allMarkers = [];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      floatingActionButton: Container(
        height: 80.0,
        width: 80,
        child: FloatingActionButton(
          backgroundColor: Color(0xFF9a0b0b),
          child: Icon(
            Icons.check,
            size: 50,
          ),
          onPressed: () {
            Navigator.pop(context, pos);
          },
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Stack(
          children: <Widget>[
            Center(
              child: Text(
                'Hospital Location',
              ),
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
      body: Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition: CameraPosition(
                target: LatLng(30.043490, 31.235290), zoom: 10.0),
            onMapCreated: onMapCreated,
            markers: Set.from(allMarkers),
          ),
          Positioned(
            top: 30.0,
            right: 15.0,
            left: 15.0,
            child: Container(
              height: 50.0,
              width: double.infinity,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  color: Colors.white),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Hospital Name',
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 15.0, top: 15.0),
                    suffixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: searchandNavigate,
                        iconSize: 30.0)),
                onChanged: (val) {
                  setState(() {
                    searchAddr = val;
                  });
                },
              ),
            ),
          )
        ],
      ),
    );
  }

  searchandNavigate() async {
    Geolocator().placemarkFromAddress(searchAddr).then((result) {
      pos = result[0];
      print(pos);
      mapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
              target: LatLng(
                  result[0].position.latitude, result[0].position.longitude),
              zoom: 16.0),
        ),
      );
      Marker marker = Marker(
          markerId: MarkerId('myMarker'),
          onTap: () {
            print('Marker Tapped');
          },
          position: LatLng(
              result[0].position.latitude, result[0].position.longitude));
      setState(() {
        allMarkers.add(marker);
      });
    });
  }

  void onMapCreated(controller) {
    mapController = controller;
  }
}
