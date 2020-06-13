import 'dart:convert';
import 'package:bloodbank/utilities/user.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'http://ipda3-tech.com/blood-bank/api/v1';

class UserFunctions {
  Future<String> register({User user}) async {
    String userToken;
    final uri = '$baseUrl/signup';
    final headers = {"Accept": "application/json"};
    http.Response response = await http.post(
      uri,
      headers: headers,
      body: {
        'name': user.name,
        'email': user.email,
        'birth_date': user.birthday,
        'city_id': '1',
        'phone': user.phoneNum,
        'donation_last_date': user.lastDonationDate,
        'password': user.password,
        'password_confirmation': user.rePassword,
        'blood_type_id': '1'
      },
    );
    int statusCode = response.statusCode;
    String responseBody = response.body;
    userToken = jsonDecode(responseBody)['data']['api_token'];
    print(jsonDecode(responseBody)['msg']);
    return userToken;
  }

  Future<String> login({String phoneNum, String password}) async {
    String userToken;
    final uri = '$baseUrl/login';
    final headers = {"Accept": "application/json"};
    http.Response response = await http.post(
      uri,
      headers: headers,
      body: {'phone': phoneNum, 'password': password},
    );
    int statusCode = response.statusCode;
    String responseBody = response.body;
    print(jsonDecode(responseBody)['msg']);
    userToken = jsonDecode(responseBody)['data']['api_token'];
    print(userToken);
    return userToken;
  }
}
