import 'dart:convert';
import 'package:bloodbank/utilities/user.dart';
import 'package:http/http.dart' as http;
import 'package:bloodbank/utilities/article.dart';

const String baseUrl = 'http://ipda3-tech.com/blood-bank/api/v1';

class UserFunctionsApi {
  Future<String> resetPassword(
      {String phoneNum,
      String password,
      String rePassword,
      String pinCode}) async {
    String msg;
    final uri = '$baseUrl/new-password';
    final headers = {"Accept": "application/json"};
    http.Response response = await http.post(
      uri,
      headers: headers,
      body: {
        'phone': phoneNum,
        'pin_code': pinCode,
        'password': password,
        'password_confirmation': rePassword
      },
    );
    String responseBody = response.body;
    msg = jsonDecode(responseBody)['msg'];
    print(jsonDecode(responseBody)['msg']);
    return msg;
  }

  Future<Map> forget({String phoneNum}) async {
    String pinCode;
    String msg;
    String email;
    var data = Map();
    final uri = '$baseUrl/reset-password';
    final headers = {"Accept": "application/json"};
    http.Response response = await http.post(
      uri,
      headers: headers,
      body: {
        'phone': phoneNum,
      },
    );
    String responseBody = response.body;
    msg = jsonDecode(responseBody)['msg'];
    print(jsonDecode(responseBody)['msg']);
    if (msg == 'برجاء فحص هاتفك') {
      pinCode =
          jsonDecode(responseBody)['data']['pin_code_for_test'].toString();
      email = jsonDecode(responseBody)['data']['email'];
      data['pinCode'] = pinCode;
      data['email'] = email;
    } else {
      pinCode = 'not found';
    }
    return data;
  }

  Future<String> register({User user}) async {
    String userToken;
    String msg;
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
    msg = jsonDecode(responseBody)['msg'];
    if (msg == 'تم الاضافة بنجاح') {
      userToken = jsonDecode(responseBody)['data']['api_token'];
    } else {
      userToken = msg;
    }
    return userToken;
  }

  Future<String> login({String phoneNum, String password}) async {
    String userToken;
    String msg;
    final uri = '$baseUrl/login';
    final headers = {"Accept": "application/json"};
    http.Response response = await http.post(
      uri,
      headers: headers,
      body: {'phone': phoneNum, 'password': password},
    );
    String responseBody = response.body;
    msg = jsonDecode(responseBody)['msg'];
    print(jsonDecode(responseBody)['msg']);
    if (msg == 'تم تسجيل الدخول') {
      userToken = jsonDecode(responseBody)['data']['api_token'];
    } else if (msg == 'بيانات الدخول غير صحيحة') {
      userToken = 'not found';
    }
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
  Future<List<Article>> getFavArticlesList(String apiToken) async {
    List<Article> articles;
    final uri = '$baseUrl/my-favourites?api_token=$apiToken';
    print(uri);
    http.Response response = await http.get(uri);
    String responseBody = response.body;
    print(jsonDecode(responseBody)['msg']);
    var articleObjJson = jsonDecode(responseBody)['data']['data'] as List;
    articles = articleObjJson
        .map((articleJson) => Article.fromJson(articleJson))
        .toList();
    return articles;
  }

  Future<List<Article>> searchArticlesApi(
      {String categoryID, String keyword, String apiToken}) async {
    List<Article> articles;
    final uri =
        '$baseUrl/posts?api_token=$apiToken&keyword=$keyword&category_id=$categoryID';
    print(uri);
    http.Response response = await http.get(uri);
    String responseBody = response.body;
    print(jsonDecode(responseBody)['msg']);
    var articleObjJson = jsonDecode(responseBody)['data']['data'] as List;
    articles = articleObjJson
        .map((articleJson) => Article.fromJson(articleJson))
        .toList();
    return articles;
  }

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
