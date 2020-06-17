import 'package:bloodbank/utilities/user.dart';
import 'package:flutter/foundation.dart';
import 'package:bloodbank/utilities/apis.dart';

class UserData extends ChangeNotifier {
  bool spinningStatus = false;
  User currentUser;
  List<User> users = [
    User(
        name: 'admin',
        email: 'admin',
        birthday: '1/3/1996',
        bloodTypeID: 'A',
        lastDonationDate: '1/3/2020',
        cityID: 'Giza',
        phoneNum: '+21555941803',
        password: 'admin',
        rePassword: 'admin')
  ];
  Future<String> register(User user) async {
    changeSpinnerStatus();
    String apiToken;
    try {
      apiToken = await UserFunctionsApi().register(user: user);
      notifyListeners();
      changeSpinnerStatus();
    } catch (e) {
      print(e);
    }
    return apiToken;
  }

  Future<User> getProfile(String apiToken) async {
    User user;
    try {
      user = await UserFunctionsApi().getProfileData(apiToken);
    } catch (e) {
      print(e);
    }
    return user;
  }

  Future<String> edit(User newData, String apiToken) async {
    String userApiToken;
    changeSpinnerStatus();
    try {
      //await UserFunctions().editUserData(user: newData, apiToken: apiToken);
      UserFunctionsApi().edit(newData, apiToken);
      currentUser = await getProfile(apiToken);
      notifyListeners();
    } catch (e) {
      print(e);
    }
    changeSpinnerStatus();
    return userApiToken;
  }

  void changeSpinnerStatus() {
    spinningStatus = !spinningStatus;
    notifyListeners();
  }

  Future<String> login(String phoneNumber, String password) async {
    changeSpinnerStatus();
    String apiToken;
    try {
      apiToken = await UserFunctionsApi()
          .login(phoneNum: phoneNumber, password: password);
      currentUser = await getProfile(apiToken);
      changeSpinnerStatus();
    } catch (e) {
      print(e);
    }
    return apiToken;
  }
}
