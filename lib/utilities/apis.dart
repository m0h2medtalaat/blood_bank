import 'dart:convert';
import 'package:bloodbank/utilities/article.dart';
import 'package:bloodbank/utilities/user.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

const String baseUrl = 'http://ipda3-tech.com/blood-bank/api/v1';

class UserFunctionsApi {
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
        'city_id': user.cityID,
        'phone': user.phoneNum,
        'donation_last_date': user.lastDonationDate,
        'password': user.password,
        'password_confirmation': user.rePassword,
        'blood_type_id': '1'
      },
    );
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
    String responseBody = response.body;
    print(jsonDecode(responseBody)['msg']);
    userToken = jsonDecode(responseBody)['data']['api_token'];
    return userToken;
  }

  Future<User> getProfileData(String apiToken) async {
    final uri = '$baseUrl/profile';
    final headers = {"Accept": "application/json"};
    http.Response response = await http.post(
      uri,
      headers: headers,
      body: {'api_token': apiToken},
    );
    String responseBody = response.body;
    print(jsonDecode(responseBody)['msg']);
    Map<String, dynamic> user = jsonDecode(responseBody)['data']['client'];
    print('${user['name']} get dataaaaaaaaaaa......');
    User _user = User(
        name: user['name'],
        email: user['email'],
        birthday: user['birth_date'],
        cityID: user['city_id'],
        phoneNum: user['phone'],
        lastDonationDate: user['donation_last_date'],
        bloodTypeID: user['blood_type_id'],
        password: '',
        rePassword: '');
    return _user;
  }

  Future edit(User user, String apiToken) async {
    final uri = '$baseUrl/profile';
    final headers = {"Accept": "application/json"};
    http.Response response;
    if (user.password == '') {
      response = await http.post(
        uri,
        headers: headers,
        body: {
          'api_token': apiToken,
          'name': user.name,
          'email': user.email,
          'birth_date': user.birthday,
          'city_id': user.cityID,
          'phone': user.phoneNum,
          'donation_last_date': user.lastDonationDate,
          'blood_type_id': user.bloodTypeID
        },
      );
    } else {
      response = await http.post(
        uri,
        headers: headers,
        body: {
          'api_token': apiToken,
          'name': user.name,
          'email': user.email,
          'birth_date': user.birthday,
          'city_id': user.cityID,
          'phone': user.phoneNum,
          'donation_last_date': user.lastDonationDate,
          'password': user.password,
          'password_confirmation': user.rePassword,
          'blood_type_id': user.bloodTypeID
        },
      );
    }
    String responseBody = response.body;
    print(jsonDecode(responseBody)['msg']);
  }
}

class ArticlesApi {
  Future<List<Article>> getArticlesList(String apiToken) async {
    List<Article> articles;
    final uri = '$baseUrl/posts?api_token=$apiToken';
    http.Response response = await http.get(uri);
    String responseBody = response.body;
    print(jsonDecode(responseBody)['msg']);
    var articleObjJson = jsonDecode(responseBody)['data']['data'] as List;
    articles = articleObjJson
        .map((articleJson) => Article.fromJson(articleJson))
        .toList();
    return articles;
  }

  Future<void> likeArticle({String apiToken, int articleID}) async {
    final uri = '$baseUrl/post-toggle-favourite';
    final headers = {"Accept": "application/json"};
    http.Response response = await http.post(
      uri,
      headers: headers,
      body: {'api_token': apiToken, 'post_id': articleID.toString()},
    );
    print(jsonDecode(response.body)['msg']);
  }

  Future<Article> getArticle({String apiToken, int articleID}) async {
    Article article;

    final uri =
        '$baseUrl/post?api_token=$apiToken&post_id=${articleID.toString()}';
    print(articleID);
    http.Response response = await http.get(uri);
    String responseBody = response.body;
    print(jsonDecode(responseBody)['msg']);
    Map<String, dynamic> _articleJson = jsonDecode(responseBody)['data'];
    article = Article.fromJson(_articleJson);
    return article;
  }
}
