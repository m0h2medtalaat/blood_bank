import 'package:cloud_firestore/cloud_firestore.dart';

class Donation {
  final String name;
  final String age;
  final String bloodType;
  final String bloodBagNum;
  final hospitalLocation;
  final String hospitalName;
  final String city;
  final String phoneNum;

  Donation(
      {this.name,
      this.age,
      this.bloodType,
      this.bloodBagNum,
      this.hospitalLocation,
      this.city,
      this.phoneNum,
      this.hospitalName});
  factory Donation.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data;
    return Donation(
        name: data['name'],
        age: data['age'],
        bloodType: data['bloodtype'],
        bloodBagNum: data['bloodbagnum'],
        city: data['city'],
        hospitalLocation: data['location'],
        phoneNum: data['phonenum'],
        hospitalName: data['hospitalName']);
  }
}
