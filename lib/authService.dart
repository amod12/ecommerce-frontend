import 'userModel.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'snackBar.dart';
import 'httpErrorHnadle.dart';

class AuthService {
  // sigup user
  void registerService({
    required String email,
    required BuildContext context,
    required String password,
    required String name,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        password: password,
        email: email,
        address: '',
        role: '',
        token: '',
      );
      http.Response res = await http.post(Uri.parse('http://:3005/register'),
          body: user.toJson(),
          headers: <String, String>{
            'Content-Type': 'application/json; charset=UTF-8',
          });
      httpErrorHandle(
          response: res,
          context: context,
          onSuccess: () {
            showSnackBar(context, 'Created Account');
          });
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }

  void signInUser({
    required String email,
    required BuildContext context,
    required String password,
  }) async {
    try {} catch (e) {}
  }
}
