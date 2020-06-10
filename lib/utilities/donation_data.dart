import 'package:flutter/foundation.dart';
import 'package:bloodbank/utilities/donation.dart';

class DonationData extends ChangeNotifier {
  List<Donation> donations = [];

  int getIndex(Donation donation) {
    return donations.indexOf(donation);
  }

  void addDonation(Donation donation) {
    donations.add(donation);
    notifyListeners();
  }
}
