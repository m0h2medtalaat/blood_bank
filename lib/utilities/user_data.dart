import 'package:bloodbank/utilities/user.dart';
import 'package:flutter/foundation.dart';
import 'package:bloodbank/utilities/apis.dart';

class UserData extends ChangeNotifier {
  bool spinningStatus = false;
  List<User> users = [
    User(
        name: 'admin',
        email: 'admin',
        birthday: '1/3/1996',
        bloodType: 'A',
        lastDonationDate: '1/3/2020',
        region: 'Haram',
        city: 'Giza',
        phoneNum: '+21555941803',
        password: 'admin',
        rePassword: 'admin')
  ];
  Future<String> register(User user) async {
    changeSpinnerStatus();
    String apiToken;
    try {
      apiToken = await UserFunctions().register(user: user);
      changeSpinnerStatus();
    } catch (e) {
      print(e);
    }
    return apiToken;
  }

  void edit(User newData, String userIndex) {
    users[0] = newData;
    notifyListeners();
  }

  void changeSpinnerStatus() {
    spinningStatus = !spinningStatus;
    notifyListeners();
  }

  Future<String> login(String phoneNumber, String password) async {
    changeSpinnerStatus();
    String apiToken;
    try {
      apiToken = await UserFunctions()
          .login(phoneNum: phoneNumber, password: password);
      changeSpinnerStatus();
    } catch (e) {
      print(e);
    }
    return apiToken;
  }
}
