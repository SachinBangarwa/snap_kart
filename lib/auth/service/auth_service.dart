import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:snap_kart/auth/model/user_model.dart';
import 'package:snap_kart/core/apiEndpoint.dart';

class AuthService {
  Future<String> login(UserModel user) async {
    String url = ApiEndpoint.loginUrl;
    String strUser = jsonEncode(user.fromJson());
    final response = await http.post(Uri.parse(url),
        body: strUser, headers: {'Content-Type':'application/json'});
    if (response.statusCode == 200) {
      String strData = response.body;
      final map = jsonDecode(strData);
      final token = map['token'];
      return token;
    } else {
      throw 'Unable to create user';

    }
  }

  Future<bool> singUp(UserModel user) async {
    String url = ApiEndpoint.sinUpUrl;
    String strUser = jsonEncode(user.fromJson());
    final response = await http.post(Uri.parse(url),
        body: strUser, headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 201) {
      return true;
    }
    return false;
  }

}
