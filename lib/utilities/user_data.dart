import 'package:bloodbank/utilities/user.dart';
import 'package:flutter/foundation.dart';

class UserData extends ChangeNotifier {
  List<User> users = [
    User(
        name: 'admin',
        email: 'admin',
        birthday: '1/3/2020',
        bloodType: 'A',
        lastDonationDate: '1/3/2020',
        region: 'Haram',
        city: 'Giza',
        phoneNum: '+200',
        password: 'admin',
        rePassword: 'admin')
  ];
  void register(User user) {
    users.add(user);
    notifyListeners();
  }

  void edit(User newData, int userIndex) {
    users[userIndex] = newData;
    notifyListeners();
  }

  int login(String email, String password) {
    int indexOfUser;
    for (int i = 0; i < users.length; i++) {
      if (email == users[i].email && password == users[i].password) {
        indexOfUser = users.indexOf(users[i]);
      } else {
        indexOfUser = 404;
      }
    }
    return indexOfUser;
  }
}
