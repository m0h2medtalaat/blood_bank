import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:bloodbank/utilities/donation.dart';
import 'dart:async';

class Database {
  final Firestore _db = Firestore.instance;

  Stream<List<Donation>> get donations {
    return _db.collection('donations').limit(10).snapshots().map((event) =>
        event.documents
            .map((DocumentSnapshot documentSnapshot) =>
                Donation.fromFirestore(documentSnapshot))
            .toList());
  }
}
